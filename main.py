# Project application code - main
# Joseph Punnapuzha

import pymysql

# import all functions from setup.py. This contains initial setup methods for login and create accounts
# file also has functions that read the songs chart/library, provides menu, and runs the different operations
from setup import *

if __name__ == '__main__':
    # prompt for user MYSQL username and password
    username = input("What is your MySQL username?\n")
    password = input("What is your MySQL password?\n")

    # connect to simple spotify schema using username and password
    try:
        cnx = pymysql.connect(host='localhost', user=username, password=password, db='simple_spotify',
                              charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor)

        print("\nWELCOME TO SIMPLE SPOTIFY\n")

        confirmed_username = ""
        error = 0
        while True:

            # start with asking user if they want to login, create a new account, or exit
            opening_action = input("Type 'login' to Login, 'create' to Create an new account, or 'exit' to Exit\n")
            opening_action = opening_action.lower()
            if opening_action == 'exit':
                error = 1
                break

            # when user enters login, call login function in setup_menu_functions.py.
            elif opening_action == 'login':
                setup = Setup(cnx)
                result = setup.login()
                if result == 'error':
                    error = 1
                elif result == 'back':
                    continue
                else:
                    confirmed_username = result
                break

            # when user enters create, call create_user function in setup_menu_functions.py. Once done, re-ask to login
            elif opening_action == 'create':
                user = Setup(cnx)
                result = user.create_user()
                if result == 'error':
                    error = 1
                    break
                continue
            else:
                print('Try again!')
                continue

        while error == 0:

            # read from MySQL the songs and print to user the music chart/music library available in Spotify Lite
            c0 = cnx.cursor()
            c0.callproc('get_top_songs_chart', ())
            print('\nMUSIC CHART:')
            for row in c0.fetchall():
                print(row)
            c0.close()

            # print menu of operations. Let user select operation which calls run_function in setup_menu_functions.py
            # after running operation, asks user if they want to run another operation or logout/exit
            print('\nChoose one of the following operations (View Music Chart above for songs available)')
            print_menu()
            choice = get_choice()
            if choice == 'exit':
                break
            r = run_function(int(choice), cnx, confirmed_username)
            if r == 'bye':
                break
            run_again = get_decision()
            if run_again == '1':
                continue
            elif run_again == '2':
                break

        print('Goodbye!')

    except pymysql.err.OperationalError as e:
        print('Sorry, looks like something went wrong. Please restart the program and try again!')

