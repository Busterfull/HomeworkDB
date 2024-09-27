SELECT ma, mg.name FROM student21.music_albums alb
    INNER JOIN student21.music_artists ma on alb.artist_id = ma.id
    INNER JOIN student21.albums_genres ag on alb.id = ag.album_id
    INNER JOIN student21.music_genres mg on ag.genre_id = mg.id
GROUP BY ma, mg.name;

SELECT ma, mg.name FROM student21.music_albums alb
    LEFT OUTER JOIN student21.music_artists ma on alb.artist_id = ma.id
    LEFT OUTER JOIN student21.albums_genres ag on alb.id = ag.album_id
    LEFT OUTER JOIN student21.music_genres mg on ag.genre_id = mg.id
GROUP BY ma, mg.name;

SELECT ma, mg.name FROM student21.music_albums alb
    RIGHT OUTER JOIN student21.music_artists ma on alb.artist_id = ma.id
    RIGHT OUTER JOIN student21.albums_genres ag on alb.id = ag.album_id
    RIGHT OUTER JOIN student21.music_genres mg on ag.genre_id = mg.id
GROUP BY ma, mg.name;

SELECT ma, mg.name FROM student21.music_albums alb
    FULL JOIN student21.music_artists ma on alb.artist_id = ma.id
    FULL JOIN student21.albums_genres ag on alb.id = ag.album_id
    FULL JOIN student21.music_genres mg on ag.genre_id = mg.id
GROUP BY ma, mg.name;