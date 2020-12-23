# functions linked to main.py

from account import *
from playlist import *
from song_artist_album import *


# function to print menu of operations
def print_menu():
    print('1. Search for song/artist/genre\n'
          '2. Find out more about a specific song (remember the ranking of the song for details)\n'
          '3. Get 1 random, interesting query about the music in the chart\n'
          '4. Update Account\n'
          '5. Delete Account\n'
          '6. Create a new playlist\n'
          '7. Delete a playlist\n'
          '8. Update playlist name\n'
          '9. Add song to playlist (remember the ranking of the song to add)\n'
          '10. Delete song from playlist\n')


# function get user input on which operation from menu they want to run
def get_choice():
    numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
    while True:
        choice = input("Pick the number of the operation you would like run: (type 'exit' to logout/exit)\n")
        choice = choice.lower()
        if choice == 'exit':
            return choice
        elif choice not in numbers:
            print('That was not a valid option. Try again!')
            continue
        else:
            return choice


# function run user selected operation
def run_function(choice, cnx, username):
    saa = SongArtistAlbum(cnx)
    acc = Account(cnx, username)
    play = Playlist(cnx, username)
    options = {1: saa.search, 2: saa.specific_song, 3: saa.random_query,
               4: acc.update_account, 5: acc.delete_account, 6: play.create_playlist,
               7: play.delete_playlist, 8: play.update_playlist_name, 9: play.add_song_playlist,
               10: play.delete_song_playlist}

    if choice in [1, 2, 3]:
        r = options[choice]()
        return r
    elif choice in [4, 5, 6, 7, 8, 9, 10]:
        r = options[choice]()
        return r


# function get user decision on if they want to run another operation or logout
def get_decision():
    while True:
        decision = input('\nType "1" to run more operations or "2" to logout/exit\n')
        if decision == '1':
            return '1'
        elif decision == '2':
            return '2'
        else:
            print('Not valid option. Try again!')
            continue


class Setup:

    def __init__(self, cnx):
        self.cnx = cnx

    # method to login the user. executes MySQL function within
    def login(self):
        try:
            while True:
                username = input("Enter your username: (type 'back' as username to go back)\n")
                username = username.lower()
                if username == 'back':
                    return 'back'
                password = input("Enter your password:\n")
                clogin = self.cnx.cursor()
                query = "SELECT confirm_login(%s, %s)"
                clogin.execute(query, (username, password))
                confirm = clogin.fetchone()
                value = -1
                for v in confirm.values():
                    value = v
                clogin.close()
                if value == 1:
                    return username
                else:
                    print('Username or password is incorrect. Try again!')
                    continue
        except:
            print('Sorry there seems to be an problem logging-in')
            return 'error'

    # method to create new user. executes MySQL function and procedure within
    def create_user(self):
        try:
            while True:
                username = input("Enter your username: (type 'back' as username to go back)\n")
                username = username.lower()
                if username == 'back':
                    break
                cuser = self.cnx.cursor()
                query = "SELECT user_check(%s)"
                cuser.execute(query, (username))
                confirm = cuser.fetchone()
                value = -1
                for v in confirm.values():
                    value = v
                cuser.close()
                if value == 1:
                    password = input("Enter your password:\n")
                    first_name = input('Enter your first name:\n')
                    last_name = input('Enter your last name:\n')
                    email = input('Enter your email:\n')
                    cregister = self.cnx.cursor()
                    cregister.callproc('add_user', (username, password, first_name, last_name, email,))
                    self.cnx.commit()
                    cregister.close()
                    print('You are registered. Login to access music!\n')
                    break
                else:
                    print('Sorry, username taken. Enter a new one!\n')
                    continue
        except:
            print('Sorry there seems to be an problem creating a new user')
            return 'error'
