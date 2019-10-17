-- $ sqlite3 users.db < sqlite.sql
--PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    username VARCHAR(255) primary key NOT NULL,
    full_name VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    homeurl TEXT,
    UNIQUE(full_name,password,email)
);

INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Aleckie', 'Ann Leckie', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'Aleckie@gmail.com','www.abc.com');
INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Jowalton', 'Jo Walton', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'JoWalton@gmail.com','www.abc.com');
INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Conniewillis', 'Connie Willis', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'Conniewillis@gmail.com','www.abc.com');
INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Davidbrin', 'David Brin', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'Davidbrin@gmail.com','www.abc.com');
INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Katewilhelm', 'Kate Wilhelm', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'Katewilhelm@gmail.com','www.abc.com');
INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Williamgibson', 'William Gibsone', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'Williamgibson@gmail.com','www.abc.com');
INSERT INTO users(username,full_name,password,email,homeurl) VALUES('Nealwalton', 'Neal Walton', '$2b$12$DbmIZ/a5LByoJHgFItyZCeIEHz9koaXCGjwc/fLJAPp5G6jmQvg4u', 'Neal@gmail.com','www.abc.com');
