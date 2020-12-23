import random


class SongArtistAlbum:  # class linked to/called from setup.py

    def __init__(self, cnx):
        self.cnx = cnx

    # method that allows user to search for artist/song/album. calls MySQL procedure within to read data
    # provides result(songs or artists or albums) that contain search item typed in
    def search(self):
        try:
            search_input = input("Search for a artist, song, or album in our music chart:\n")
            search_input = search_input.lower()
            c2 = self.cnx.cursor()
            c2.callproc('search', (search_input,))
            print("Below are the results that contain:", search_input)
            for row in c2.fetchall():
                print(row)
            c2.close()
        except:
            print('Something went wrong with the search feature')
            return 'bye'

    # method that prints various details associated with a particular song. calls MySQL procedure within to read data
    def specific_song(self):
        while True:
            input_song = input("Enter the ranking of the song you want to find more details about:\n")
            try:
                if 1 <= int(input_song) <= 30:
                    c2 = self.cnx.cursor()
                    c2.callproc('get_song_details', (int(input_song),))
                    for row in c2.fetchall():
                        print(row)
                    c2.close()
                    break
                else:
                    print('That is an invalid input. Try again!')
            except ValueError:
                print('That is an invalid input. Try again!')
                continue

    # method that picks one of six interesting queries that maybe used for analysis or visualization of data
    def random_query(self):
        query = random.randint(1, 6)
        if query == 1:
            self.get_danceable()
        elif query == 2:
            self.get_genre_song_avg()
        elif query == 3:
            self.get_streams_country()
        elif query == 4:
            self.get_popular_artists()
        elif query == 5:
            self.get_avg_artist_streams()
        else:
            self.get_positive_albums()

    # method that gets interesting query #1. calls MySQL procedure within
    def get_danceable(self):
        try:
            print('These are the top 5 tracks for dancing based on a combination '
                  'of musical elements including tempo, rhythm stability, beat strength, and overall regularity.\n')
            c3a = self.cnx.cursor()
            c3a.callproc('get_top_danceable', ())
            for row in c3a.fetchall():
                print(row)
            c3a.close()
        except:
            print('Oops, looks like something went wrong with this query')
            return 'bye'

    # method that gets interesting query #2. calls MySQL procedure within
    def get_genre_song_avg(self):
        try:
            print('Here is a breakdown of what the average streams per song is for each genre '
                  'based on the songs in the music chart\n')
            c3b = self.cnx.cursor()
            c3b.callproc('get_genre_song_avg', ())
            for row in c3b.fetchall():
                print(row)
            c3b.close()
        except:
            print('Oops, looks like something went wrong with this query')
            return 'bye'

    # method that gets interesting query #3. calls MySQL procedure within
    def get_streams_country(self):
        try:
            print('Take a look below at which countries have generated the most streams '
                  'based on the nationality of the artists in the chart\n')
            c3c = self.cnx.cursor()
            c3c.callproc('get_streams_country', ())
            for row in c3c.fetchall():
                print(row)
            c3c.close()
        except:
            print('Oops, looks like something went wrong with this query')
            return 'bye'

    # method that gets interesting query #4. calls MySQL procedure within
    def get_popular_artists(self):
        try:
            print('Below are the most current popular artists. This means they have an average score '
                  'of at least 90 from their songs in the chart. The popularity score is determined, by Spotify, '
                  'calculating total number of plays the track has had and how recent those plays are\n')
            c3d = self.cnx.cursor()
            c3d.callproc('get_popular_artists', ())
            for row in c3d.fetchall():
                print(row)
            c3d.close()
        except:
            print('Oops, looks like something went wrong with this query')
            return 'bye'

    # method that gets interesting query #5. calls MySQL procedure within
    def get_avg_artist_streams(self):
        try:
            print(
                'Here is the list of all of the artists in the chart '
                'and what their average streams are for their songs\n')
            c3e = self.cnx.cursor()
            c3e.callproc('get_avg_artist_streams', ())
            for row in c3e.fetchall():
                print(row)
            c3e.close()
        except:
            print('Oops, looks like something went wrong with this query')
            return 'bye'

    # method that gets interesting query #6. calls MySQL procedure within
    def get_positive_albums(self):
        try:
            print('These 5 albums are the albums that sound the most positive (e.g. happy, cheerful, euphoric)'
                  ' based on the positivity of the songs in the album\n')
            c3f = self.cnx.cursor()
            c3f.callproc('get_positive_albums', ())
            for row in c3f.fetchall():
                print(row)
            c3f.close()
        except:
            print('Oops, looks like something went wrong with this query')
            return 'bye'
