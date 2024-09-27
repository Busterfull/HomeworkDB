--Добавление колонки в музыкальные треки для подсчета количества прослушиваний
ALTER TABLE IF EXISTS student21.books
    ADD COLUMN IF NOT EXISTS count_downloads                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS count_pages                      INT
;

COMMENT ON COLUMN student21.books.count_downloads              IS 'Количество скачиваний книги';
COMMENT ON COLUMN student21.books.count_pages                  IS 'Количество скачиваний книги';

--Таблица с книжными жанрами
INSERT INTO student21.book_genres (name) VALUES ('Комедия');
INSERT INTO student21.book_genres (name) VALUES ('Детектив');
INSERT INTO student21.book_genres (name) VALUES ('Фантастика');
INSERT INTO student21.book_genres (name) VALUES ('Исторический роман');
INSERT INTO student21.book_genres (name) VALUES ('Пьеса');
INSERT INTO student21.book_genres (name) VALUES ('Эссе');
INSERT INTO student21.book_genres (name) VALUES ('Рассказ');

--Таблица с авторами книг
INSERT INTO student21.authors_books (firstname, middlename, lastname, country_id, bithday, biography, count_books)  VALUES (
    'Митио',
    null,
    'Каку',
    (SELECT countries.id FROM student21.countries WHERE name='США'),
    '1947-01-24',
    'Американский физик-теоретик',
    11
);

INSERT INTO student21.authors_books (firstname, middlename, lastname, country_id, bithday, biography, count_books)  VALUES (
    'Ричард',
    null,
    'Докинз',
    (SELECT countries.id FROM student21.countries WHERE name='Великобритания'),
    '1941-03-26',
    'Английский этолог',
    20
);

INSERT INTO student21.authors_books (firstname, middlename, lastname, country_id, bithday, biography, count_books)  VALUES (
    'Ричард',
    'Филлипс',
    'Фейнман',
    (SELECT countries.id FROM student21.countries WHERE name='США'),
    '1918-05-11',
    'Американский физик',
    20
);

INSERT INTO student21.authors_books (firstname, middlename, lastname, country_id, bithday, biography, count_books)  VALUES (
    'Юрий',
    'Николаевич',
    'Тынянов',
    (SELECT countries.id FROM student21.countries WHERE name='СССР'),
    '1894-10-18',
    'Прозаик',
    15
);

INSERT INTO student21.authors_books (firstname, middlename, lastname, country_id, bithday, biography, count_books)  VALUES (
    'Братья',
    null,
    'Стругацкие',
    (SELECT countries.id FROM student21.countries WHERE name='СССР'),
    null,
    'Советские писатели',
    2
);


--Таблица с книгами
INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'Физика невозможного',
    '1999-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Митио' and auth.lastname = 'Каку'),
    1,
    'Научная литература',
    9.0,
    2000,
    460
);

INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'Эгоистичный ген"',
    '1989-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Ричард' and auth.lastname = 'Докинз'),
    2,
    'Научная литература',
    9.0,
    400,
    610
);

INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'Вы, конечно, шутите, мистер Фейман',
    '1985-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Ричард' and auth.lastname = 'Фейнман'),
    3,
    'Анекдоты',
    8.0,
    1000,
    450
);

INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'Кюхля',
    '1925-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Юрий'and auth.lastname = 'Тынянов'),
    4,
    null,
    8.8,
    2300,
    350
);

INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'За миллиард лет до конца света',
    '1977-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Братья'and auth.lastname = 'Стругацкие'),
    5,
    null,
    9.8,
    20000,
    150
);

INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'Понедельник начинается в субботу',
    '1964-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Братья'and auth.lastname = 'Стругацкие'),
    6,
    null,
    9.6,
    21000,
    250
);

INSERT INTO student21.books (name, release_date, author_id, file_id, description, rating, count_downloads, count_pages)  VALUES (
    'Уравнение Бога. В поисках теории всего',
    '1999-06-12',
    (SELECT auth.id FROM authors_books auth WHERE auth.firstname = 'Митио' and auth.lastname = 'Каку'),
    7,
    'Научная литература',
    9.1,
    1700,
    200
);

--Связующая таблица книги и жанры
INSERT INTO student21.books_genres(book_id, genre_id)  VALUES (
    (SELECT b.id FROM student21.books b
        INNER JOIN student21.authors_books auth on b.author_id = auth.id
    WHERE b.name='Кюхля' and auth.firstname='Юрий' and auth.lastname='Тынянов'),
    (SELECT book_genres.id FROM student21.book_genres WHERE name='Исторический роман')
);

INSERT INTO student21.books_genres(book_id, genre_id)  VALUES (
    (SELECT b.id FROM student21.books b
        INNER JOIN student21.authors_books auth on b.author_id = auth.id
    WHERE b.name='За миллиард лет до конца света' and auth.firstname='Братья' and auth.lastname='Стругацкие'),
    (SELECT book_genres.id FROM student21.book_genres WHERE name='Фантастика')
);

INSERT INTO student21.books_genres(book_id, genre_id)  VALUES (
    (SELECT b.id FROM student21.books b
        INNER JOIN student21.authors_books auth on b.author_id = auth.id
    WHERE b.name='Понедельник начинается в субботу' and auth.firstname='Братья' and auth.lastname='Стругацкие'),
    (SELECT book_genres.id FROM student21.book_genres WHERE name='Фантастика')
);

SELECT * from student21.books_to_1000;
SELECT * from student21.books_to_10000;
SELECT * from student21.books_up_10000;