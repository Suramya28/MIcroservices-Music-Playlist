-- :name update_track :insert
UPDATE tracks set description=:description where trackurl=:trackurl and username=:username;
