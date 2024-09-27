SELECT ma FROM student21.music_artists ma
INNER JOIN student21.music_albums alb ON ma.id = alb.artist_id
INNER JOIN student21.music_tracks mt on alb.id = mt.album_id
GROUP BY ma.id
HAVING AVG(mt.count_view) > 2000