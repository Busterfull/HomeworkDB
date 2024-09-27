--Наполнение таблиц
--Добавление колонки в музыкальные треки для подсчета количества прослушиваний
ALTER TABLE IF EXISTS student21.music_tracks
    ADD COLUMN IF NOT EXISTS count_view                   BIGSERIAL
;

COMMENT ON COLUMN student21.music_tracks.count_view              IS 'Количество прослушиваний музыкального трека';

--Таблица с музыкальными жанрами
INSERT INTO student21.music_genres (name) VALUES ('Рок');
INSERT INTO student21.music_genres (name) VALUES ('Джаз');
INSERT INTO student21.music_genres (name) VALUES ('Блюз');
INSERT INTO student21.music_genres (name) VALUES ('Поп');
INSERT INTO student21.music_genres (name) VALUES ('Хип-хоп');
INSERT INTO student21.music_genres (name) VALUES ('Шансон');
INSERT INTO student21.music_genres (name) VALUES ('Классическая музыка');

--Таблица с музыкальными артистами
INSERT INTO student21.music_artists (firstname, middlename, lastname, country_id, bithday)  VALUES (
   'Валерий',
   'Шотаевич',
   'Меладзе',
   (SELECT countries.id FROM student21.countries WHERE name='Российская Федерация'),
   '1965-07-23'
);

INSERT INTO student21.music_artists (firstname, middlename, lastname, country_id, bithday)  VALUES (
   'Джеймс',
   'Пол',
   'Маккартни',
   (SELECT countries.id FROM student21.countries WHERE name='Великобритания'),
   '1942-06-18'
);

INSERT INTO student21.music_artists (firstname, middlename, lastname, country_id, bithday)  VALUES (
   'Джеймс',
   'Пол',
   'Маккартни',
   (SELECT countries.id FROM student21.countries WHERE name='Великобритания'),
   '1942-06-18'
);



--Таблица с музыкальными альбомами
INSERT INTO student21.music_albums (name, release_date, artist_id)  VALUES (
   'Океан',
   '2005-09-04',
   (SELECT music_artists.id FROM student21.music_artists WHERE firstname='Валерий' and middlename='Шотаевич' and lastname='Меладзе')
);

INSERT INTO student21.music_albums (name, release_date, artist_id)  VALUES (
   'Red Rose Speedway',
   '1973-04-30',
   (SELECT music_artists.id FROM student21.music_artists WHERE firstname='Джеймс' and middlename='Пол' and lastname='Маккартни')
);


--Связующая таблица альбомы и жанры
INSERT INTO student21.albums_genres (album_id, genre_id)  VALUES (
    (SELECT music_albums.id FROM student21.music_albums
        INNER JOIN student21.music_artists ma on music_albums.artist_id = ma.id
            WHERE name='Океан' and firstname='Валерий' and middlename='Шотаевич' and lastname='Меладзе'),
    (SELECT music_genres.id FROM student21.music_genres WHERE name='Поп')
);

INSERT INTO student21.albums_genres (album_id, genre_id)  VALUES (
    (SELECT music_albums.id FROM student21.music_albums
        INNER JOIN student21.music_artists ma on music_albums.artist_id = ma.id
            WHERE name='Red Rose Speedway' and firstname='Джеймс' and middlename='Пол' and lastname='Маккартни'),
     (SELECT music_genres.id FROM student21.music_genres WHERE name='Рок')
);


--Таблица с музыкальными треками
INSERT INTO student21.music_tracks (name, album_id, file_id, count_view)  VALUES (
     'Салют, Вера!',
     (SELECT music_albums.id FROM student21.music_albums
        INNER JOIN student21.music_artists ma on music_albums.artist_id = ma.id
            WHERE name='Океан' and firstname='Валерий' and middlename='Шотаевич' and lastname='Меладзе'),
     1,
     124
 );

INSERT INTO student21.music_tracks (name, album_id, file_id, count_view)  VALUES (
     'My Love',
     (SELECT music_albums.id FROM student21.music_albums
        INNER JOIN student21.music_artists ma on music_albums.artist_id = ma.id
            WHERE name='Red Rose Speedway' and firstname='Джеймс' and middlename='Пол' and lastname='Маккартни'),
     2,
     43632
);

INSERT INTO student21.music_tracks (name, album_id, file_id, count_view)  VALUES (
     'When the night',
     (SELECT music_albums.id FROM student21.music_albums
        INNER JOIN student21.music_artists ma on music_albums.artist_id = ma.id
            WHERE name='Red Rose Speedway' and firstname='Джеймс' and middlename='Пол' and lastname='Маккартни'),
     3,
     2598
);