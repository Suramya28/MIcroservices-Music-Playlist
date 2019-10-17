-- $ sqlite3 users.db < sqlite.sql
PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS tracks;
CREATE TABLE tracks(
    trackid INTEGER primary key NOT NULL,
    trackurl VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    username VARCHAR(255) NOT NULL,
    FOREIGN KEY(username) REFERENCES users(username),
    UNIQUE(trackurl,description,username)
);
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Aleckie');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Jowalton');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl2','My Favourite Track2','Aleckie');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl2','My Favourite Track2','Jowalton');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Conniewillis');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Davidbrin');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Katewilhelm');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Williamgibson');
INSERT INTO tracks(trackurl,description,username) VALUES('trackurl1','My Favourite Track1','Nealwalton');
