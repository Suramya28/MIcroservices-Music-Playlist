-- :name fetch_track_id :one
SELECT trackid FROM tracks WHERE username = :username and trackurl=:trackurl;
