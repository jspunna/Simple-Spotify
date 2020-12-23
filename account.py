
class Account:  # linked to setup.py

    def __init__(self, cnx, username):
        self.cnx = cnx
        self.username = username

    # method to delete user account. calls MySQL procedure within
    def delete_account(self):
        while True:
            try:
                action = input("Are you sure you want to delete account? Enter 'yes' or 'no:\n")
                action = action.lower()
                if action == 'no':
                    break
                elif action == 'yes':
                    c5 = self.cnx.cursor()
                    c5.callproc('delete_user', (self.username,))
                    self.cnx.commit()
                    c5.close()
                    print('Sad to see you go :(')
                    return 'bye'
                else:
                    print('Not a valid input. Try Again')
                    continue
            except:
                print('Looks like something when wrong with deleting account\n')
                return 'bye'

    # method update certain aspects of user account. calls MySQL procedures within
    def update_account(self):
        while True:
            try:
                choice = input('What would you like to update?:\n'
                               "Type 'p' for Password\n"
                               "Type 'f' for First Name\n"
                               "Type 'l' for Last Name\n"
                               "Type 'e' for Email\n")
                choice = choice.lower()
                if choice == 'p':
                    new_password = input('Enter new password:\n')
                    c4a1 = self.cnx.cursor()
                    c4a1.callproc('update_password', (self.username, new_password))
                    self.cnx.commit()
                    c4a1.close()
                    print('Changes to password made!')
                    break
                elif choice == 'f':
                    new_first = input('Enter new first name:\n')
                    c4a2 = self.cnx.cursor()
                    c4a2.callproc('update_first', (self.username, new_first))
                    self.cnx.commit()
                    c4a2.close()
                    print('Changes to first name made!')
                    break
                elif choice == 'l':
                    new_last = input('Enter new last name:\n')
                    c4a3 = self.cnx.cursor()
                    c4a3.callproc('update_last', (self.username, new_last))
                    self.cnx.commit()
                    c4a3.close()
                    print('Changes to last name made!')
                    break
                elif choice == 'e':
                    new_email = input('Enter new email:\n')
                    c4a4 = self.cnx.cursor()
                    c4a4.callproc('update_email', (self.username, new_email))
                    self.cnx.commit()
                    c4a4.close()
                    print('Changes to email made!')
                    break
                else:
                    print('Not a valid input. Try Again')
                    continue
            except:
                print('Something went wrong trying to update account')
                return 'bye'