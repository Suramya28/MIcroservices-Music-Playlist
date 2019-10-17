-- :name fetch_track :one
SELECT description FROM tracks WHERE username = :username and trackurl=:trackurl;
