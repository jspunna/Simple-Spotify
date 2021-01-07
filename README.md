# Simple-Spotify

This is a command-line application is called Simple Spotify because, though I have not recreated Spotify, I have built a couple of capabilities which are used in streaming music services such as Spotify. The main reason I have decided to choose the project domain around music is because I have a passion for it. I enjoy playing different instruments, listening to music, discovering new music, going to shows/festivals, or even learning about certain genres/artists/songs.

The command-line application built will allow users to perform CRUD operations. They will be able to view a collection/library of songs and run one of ten operations/commands. Everything from creating/deleting playlists to finding out more about a song in the library/chart to updating user information, just to name a few. Just to note, like normal users on music streaming services like Spotify, users will not be able to add/delete a song from the main song library/chart, only in their personal playlists.

This project uses SQL within the MySQL Workbench database. Furthermore, OOP Python is used for the application. The application requires connection/access to MYSQL Workbench in order to run the schema as well as being able to open/run Python files. If you don't have, software like MYSQL Workbench, there maybe a need to install it.

Please refer to the logical_design.pdf in the repo to understand the relationships of the schema.

# Running the application

First, run the simple_spotify.sql in Workbench to create the database containing all the tables needed, as well as the necessary data populated into the necessary tables. This is required before running the Python application code. 

The application code is made up of five files: main.py, setup.py, account.py, playlist.py, and song_artist_album.py. The account.py holds the Account class containing methods for  deleting and updating the user account. The playlist.py holds the Playlist class containing methods involved with anything playlist related. The song_artist_album_functions.py holds the SongArtistAlbum class containing methods that read data from the song, artist, and album database tables. The setup.py contains functions and the Setup Class which call/run methods in the previously mentioned files as well as logging/creating users. 

When you run the main.py file, it will ask for your MYSQL username and password. Please enter this in order to automatically connect to the project database in Workbench. The application will connect to the database through pymysql, which is already imported in the application code. 

User must create an account in the beginning. Only after creating an account, and then logging in with that account, may he/she read the music library/chart and run the different operations provided. 
