CREATE TABLE IF NOT EXISTS student21.book_genres();


ALTER TABLE IF EXISTS student21.book_genres
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_genres_book PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  student21.book_genres                      IS 'Таблица жанрами электронной книги';
COMMENT ON COLUMN student21.book_genres.id                   IS 'Идентификатор жанра электронной книги';
COMMENT ON COLUMN student21.book_genres.name                 IS 'Имя жанра электронной книги';