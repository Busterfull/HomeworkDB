CREATE TABLE IF NOT EXISTS student21.books();


ALTER TABLE IF EXISTS student21.books
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_books PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS release_date               DATE,
    ADD COLUMN IF NOT EXISTS author_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS file_id                    BIGSERIAL,
    ADD COLUMN IF NOT EXISTS description                TEXT
;

COMMENT ON TABLE  student21.books                            IS 'Таблица с электронными книгами';
COMMENT ON COLUMN student21.books.id                         IS 'Идентификатор книги';
COMMENT ON COLUMN student21.books.name                       IS 'Название книги';
COMMENT ON COLUMN student21.books.release_date               IS 'Дата выхода книги';
COMMENT ON COLUMN student21.books.author_id                  IS 'id автора книги';
COMMENT ON COLUMN student21.books.file_id                    IS 'id файла книги';
COMMENT ON COLUMN student21.books.description                IS 'Описание книги';

ALTER TABLE student21.books ADD foreign key (author_id) REFERENCES student21.authors_books(id);
