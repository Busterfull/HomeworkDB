CREATE TABLE IF NOT EXISTS student21.books_genres();


ALTER TABLE IF EXISTS student21.books_genres
    ADD COLUMN IF NOT EXISTS ID                        BIGSERIAL CONSTRAINT pk_books_genres PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS book_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS genre_id                  BIGSERIAL
;

COMMENT ON TABLE  student21.books_genres                          IS 'Таблица взаимодействия книг и жанров';
COMMENT ON COLUMN student21.books_genres.book_id                  IS 'id книги';
COMMENT ON COLUMN student21.books_genres.genre_id                 IS 'id жанра';

ALTER TABLE student21.books_genres ADD foreign key (book_id) REFERENCES student21.books(id);
ALTER TABLE student21.books_genres ADD foreign key (genre_id) REFERENCES student21.book_genres(id);