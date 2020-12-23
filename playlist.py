
class Playlist:  # linked to/called from setup.py

    def __init__(self, cnx, username):
        self.cnx = cnx
        self.username = username

    # method to create a playlist associated with username. calls MySQL procedures within
    def create_playlist(self):
        while True:
            try:
                playlist = input("Enter the name of your new playlist: (type 'back' to go back)\n")
                playlist = playlist.lower()
                if playlist == 'back':
                    break
                else:
                    result = check_playlist(self.cnx, self.username, playlist)
                    if result == 1:
                        print('You already have a playlist called that. Pick a new name!')
                        continue
                    elif result == 0:
                        c6 = self.cnx.cursor()
                        c6.callproc('create_playlist', (self.username, playlist))
                        self.cnx.commit()
                        c6.close()
                        print('Playlist added!')
                        break
                    else:
                        break
            except:
                print('Looks like something when wrong with creating a playlist account\n')
                return 'bye'

    # method to delete a playlist associated with username. calls MySQL procedures within
    def delete_playlist(self):
        while True:
            try:
                self.view_playlists()
                playlist = input("\nEnter the name of the playlist to delete: (type 'back' to go back)\n")
                playlist = playlist.lower()
                if playlist == 'back':
                    break
                else:
                    result = check_playlist(self.cnx, self.username, playlist)
                    if result == 0:
                        print('That playlist does not exist! Try again!')
                        continue
                    elif result == 1:
                        c7 = self.cnx.cursor()
                        c7.callproc('delete_playlist', (self.username, playlist))
                        self.cnx.commit()
                        c7.close()
                        print('Playlist deleted!')
                        break
                    else:
                        break
            except:
                print('Looks like something when wrong with deleting a playlist account\n')
                return 'bye'

    # method updates playlist to new name for given username. calls MySQL procedures within
    def update_playlist_name(self):
        while True:
            try:
                self.view_playlists()
                old_name = input("\nEnter the name of the playlist whose name you want to change: "
                                 "(type 'back' to go back/exit)\n")
                old_name = old_name.lower()
                if old_name == 'back':
                    break
                else:
                    result = check_playlist(self.cnx, self.username, old_name)
                    if result == 0:
                        print('You do not have that playlist! Try again!')
                        continue
                    elif result == 1:
                        new_name = input("Enter the new name for the playlist:\n")
                        new_name = new_name.lower()
                        c8 = self.cnx.cursor()
                        c8.callproc('update_playlist', (self.username, old_name, new_name))
                        self.cnx.commit()
                        c8.close()
                        print('Playlist name updated!')
                        break
            except:
                print('Looks like something when wrong with updating the playlist account\n')
                return 'bye'

    # method to that reads and prints all playlists of user. calls MySQL procedure within
    def view_playlists(self):
        try:
            c = self.cnx.cursor()
            c.callproc('view_playlists', (self.username,))
            print('BELOW ARE YOUR PLAYLISTS:')
            for row in c.fetchall():
                print(row)
            c.close()
        except:
            return

    # method add song to playlist of user. calls MySQL procedures within
    def add_song_playlist(self):
        while True:
            try:
                self.view_playlists()
                playlist = input("\nEnter the name of the playlist you want to add a song to: "
                                 "(type 'back' to go back/exit)\n")
                playlist = playlist.lower()
                if playlist == 'back':
                    break
                result = check_playlist(self.cnx, self.username, playlist)
                if result == 0:
                    print('You do not have that playlist. Try again!\n')
                    continue
                elif result == 1:
                    input_song = input("Enter the ranking of the song you want to add to the playlist:\n")
                    if input_song.isdigit() and (1 <= int(input_song) <= 30):
                        check = check_playlist_song(self.cnx, self.username, playlist, int(input_song))
                        if check == 1:
                            print("Oops, you already previously added that song into the playlist.\n")
                            break
                        elif check == 0:
                            c9 = self.cnx.cursor()
                            c9.callproc('add_to_playlistsong', (self.username, playlist, int(input_song),))
                            self.cnx.commit()
                            c9.close()
                            print("Song Added!")
                            break
                        else:
                            break
                    else:
                        print("That is an invalid input. Let's try again!\n")
                        continue
                else:
                    break
            except:
                print('Looks like something when wrong with adding a song to the playlist account\n')
                return 'bye'

    # method that reads songs associated with playlists of user. calls MySQL procedure within
    def view_playlists_songs(self):
        try:
            c = self.cnx.cursor()
            c.callproc('view_playlist_songs', (self.username,))
            print('BELOW ARE YOUR PLAYLISTS AND THEIR SONGS:')
            for row in c.fetchall():
                print(row)
            c.close()
        except:
            return -1

    # method delete song from playlist of user. calls MySQL procedures within
    def delete_song_playlist(self):
        while True:
            try:
                view = self.view_playlists_songs()
                if view == -1:
                    print('Something went wrong printing your playlists and songs\n')
                    break
                playlist = input("\nEnter the name of the playlist you want to delete the song from: "
                                 "(type 'back' to go back/exit)\n")
                playlist = playlist.lower()
                if playlist == 'back':
                    break
                result = check_playlist(self.cnx, self.username, playlist)
                if result == 0:
                    print('You do not have that playlist. Try again!\n')
                    continue
                elif result == 1:
                    input_song = input("Enter the Song_ID of the song you want to remove from the playlist:\n")
                    if input_song.isdigit() and (1 <= int(input_song) <= 30):
                        check = check_playlist_song(self.cnx, self.username, playlist, int(input_song))
                        if check == 1:
                            c10 = self.cnx.cursor()
                            c10.callproc('delete_from_playlistsong', (self.username, playlist, int(input_song),))
                            self.cnx.commit()
                            c10.close()
                            print("Song Removed")
                            break
                        elif check == 0:
                            print("That song doesn't exist\n")
                            continue
                        else:
                            break
                    else:
                        print("That is an invalid input. Let's try again!\n")
                        continue
            except:
                print('Looks like something when wrong with adding a song to the playlist account\n')
                return 'bye'


# function checks to see if a song for a user is already in the playlist. executes MySQL function within
def check_playlist_song(cnx, username, playlist_name, song):
    try:
        c = cnx.cursor()
        query = "SELECT check_playlistsong_exists(%s, %s, %s)"
        c.execute(query, (username, playlist_name, song))
        confirm = c.fetchone()
        value = -1
        for v in confirm.values():
            value = v
        c.close()
        return value
    except:
        print('Something went wrong check if the song is in the playlist\n')
        return -1


# function to see if playlist name associated with user exists. executes MySQL function within
def check_playlist(cnx, username, playlist_name):
    try:
        c = cnx.cursor()
        query = "SELECT playlist_exists(%s, %s)"
        c.execute(query, (username, playlist_name))
        confirm = c.fetchone()
        value = -1
        for v in confirm.values():
            value = v
        c.close()
        return value
    except:
        print('Something went wrong trying to get playlists associated with your username')
        return -1