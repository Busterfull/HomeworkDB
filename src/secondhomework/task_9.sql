SELECT mar, AVG(count_view) FROM student21.music_tracks mt
    INNER JOIN student21.music_albums alb ON mt.album_id = alb.id
    INNER JOIN student21.music_artists mar ON alb.artist_id = mar.id
GROUP BY mar
ORDER BY mar DESC