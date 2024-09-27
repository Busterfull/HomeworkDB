DROP TABLE student21.books;

CREATE TABLE IF NOT EXISTS student21.books(
    id                         BIGSERIAL ,
    name                       VARCHAR,
    release_date               DATE,
    author_id                  BIGSERIAL,
    file_id                    BIGSERIAL,
    description                TEXT,
    rating                     FLOAT,
    count_downloads            BIGSERIAL,
    count_pages                INT
)PARTITION BY RANGE(count_downloads);;

COMMENT ON TABLE  student21.books                            IS 'Таблица с электронными книгами';
COMMENT ON COLUMN student21.books.id                         IS 'Идентификатор книги';
COMMENT ON COLUMN student21.books.name                       IS 'Название книги';
COMMENT ON COLUMN student21.books.release_date               IS 'Дата выхода книги';
COMMENT ON COLUMN student21.books.author_id                  IS 'id автора книги';
COMMENT ON COLUMN student21.books.file_id                    IS 'id файла книги';
COMMENT ON COLUMN student21.books.description                IS 'Описание книги';
COMMENT ON COLUMN student21.books.count_downloads            IS 'Количество скачиваний книги';
COMMENT ON COLUMN student21.books.count_pages                IS 'Количество скачиваний книги';

ALTER TABLE student21.books ADD foreign key (author_id) REFERENCES student21.authors_books(id);

CREATE TABLE student21.books_to_1000 PARTITION OF student21.books
    FOR VALUES FROM (0) TO (1000);
CREATE TABLE student21.books_to_10000 PARTITION OF student21.books
    FOR VALUES FROM (1000) TO (10000);
CREATE TABLE student21.books_up_10000 PARTITION OF student21.books
    FOR VALUES FROM (10000) TO (maxvalue);