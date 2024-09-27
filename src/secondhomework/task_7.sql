SELECT SUM(count_view) FROM student21.music_tracks mt
    INNER JOIN student21.music_albums alb ON mt.album_id = alb.id
    INNER JOIN student21.albums_genres ag on alb.id = ag.album_id
    INNER JOIN student21.music_genres mg on ag.genre_id = mg.id
WHERE mg.name='Рок'