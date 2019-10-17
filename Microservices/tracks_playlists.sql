-- $ sqlite3 tracks_playlists.db < sqlite.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS tracks;
CREATE TABLE tracks
(
    id INTEGER primary key,
    track_title VARCHAR,
    album_title VARCHAR,
    artist VARCHAR,
    track_length VARCHAR,
    URL_media VARCHAR,
    URL_artwork VARCHAR
);

INSERT INTO tracks(track_title,album_title,artist,track_length,URL_media,URL_artwork)
VALUES("A Brief Interlude", "If It Were You We Would Never Leave", "Andrew Bayer","2:50", "/Users/brandontomich/Desktop/ProjectAPI/tracks/09 A Brief Interlude.mp3","");

DROP TABLE IF EXISTS playlists;
CREATE TABLE playlists
(
    id INTEGER primary key,
    playlist_title VARCHAR,
    URL_list VARCHAR,
    username VARCHAR,
    description VARCHAR
);

INSERT INTO playlists(playlist_title,URL_list,username,description)
VALUES("MyPlaylist", '["Track1","Track2","Track3","Track4"]', "Brandon","This Track is good");
