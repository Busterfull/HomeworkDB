CREATE TABLE IF NOT EXISTS student21.users_books();


ALTER TABLE IF EXISTS student21.users_books
    ADD COLUMN IF NOT EXISTS ID                        BIGSERIAL CONSTRAINT pk_users_books PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS user_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS book_id                   BIGSERIAL
;

COMMENT ON TABLE  student21.users_books                          IS 'Таблица взаимодействия пользователей и книг';
COMMENT ON COLUMN student21.users_books.user_id                  IS 'id пользователя';
COMMENT ON COLUMN student21.users_books.book_id                  IS 'id книги';

ALTER TABLE student21.users_books ADD foreign key (user_id) REFERENCES student21.users_bookmarket(id);
ALTER TABLE student21.users_books ADD foreign key (book_id) REFERENCES student21.books(id);