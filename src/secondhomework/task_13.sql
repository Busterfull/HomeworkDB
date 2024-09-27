INSERT INTO student21.music_albums (name, release_date, artist_id)  VALUES (
    'Soli',
    '1979-02-28',
    (SELECT music_artists.id FROM student21.music_artists WHERE firstname='Адриано' and lastname='Челентано')
);

SELECT alb, mg.name FROM student21.music_genres mg
    RIGHT JOIN student21.albums_genres ag on mg.id = ag.genre_id
    RIGHT JOIN student21.music_albums alb on alb.id = ag.album_id
WHERE mg.name IS NULL or mg.name <> 'Поп'