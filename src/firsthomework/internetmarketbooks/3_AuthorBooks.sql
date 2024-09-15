CREATE TABLE IF NOT EXISTS student21.authors_books();


ALTER TABLE IF EXISTS student21.authors_books
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_author_books PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS firstname                  VARCHAR,
    ADD COLUMN IF NOT EXISTS middlename                 VARCHAR,
    ADD COLUMN IF NOT EXISTS lastname                   VARCHAR,
    ADD COLUMN IF NOT EXISTS country_id                 BIGSERIAL,
    ADD COLUMN IF NOT EXISTS bithday                    DATE,
    ADD COLUMN IF NOT EXISTS biography                  TEXT,
    ADD COLUMN IF NOT EXISTS count_books                SMALLINT
;

COMMENT ON TABLE  student21.authors_books                            IS 'Таблица с авторами электронных книг';
COMMENT ON COLUMN student21.authors_books.id                         IS 'Идентификатор автора электронной книги';
COMMENT ON COLUMN student21.authors_books.firstname                  IS 'Имя автора электронной книги';
COMMENT ON COLUMN student21.authors_books.middlename                 IS 'Отчество автора электронной книги';
COMMENT ON COLUMN student21.authors_books.lastname                   IS 'Фамилия автора электронной книги';
COMMENT ON COLUMN student21.authors_books.country_id                 IS 'id страны автора электронной книги';
COMMENT ON COLUMN student21.authors_books.bithday                    IS 'День рождения автора книги';
COMMENT ON COLUMN student21.authors_books.biography                  IS 'Биография автора книги';
COMMENT ON COLUMN student21.authors_books.count_books                IS 'Количество книг выпущенное автором';

ALTER TABLE student21.authors_books ADD foreign key (country_id) REFERENCES student21.countries(id);