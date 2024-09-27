SELECT ma FROM student21.music_artists ma
    INNER JOIN student21.music_albums alb ON ma.id = alb.artist_id
    INNER JOIN student21.albums_genres ag on alb.id = ag.album_id
    INNER JOIN student21.music_genres mg on ag.genre_id = mg.id
WHERE mg.name='Рок'