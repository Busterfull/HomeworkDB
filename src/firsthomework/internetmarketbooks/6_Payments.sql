CREATE TABLE IF NOT EXISTS student21.payments();


ALTER TABLE IF EXISTS student21.payments
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_payments PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS user_id                    BIGSERIAL,
    ADD COLUMN IF NOT EXISTS created                    TIMESTAMP WITH TIME ZONE,
    ADD COLUMN IF NOT EXISTS status                     VARCHAR,
    ADD COLUMN IF NOT EXISTS book_id                    BIGSERIAL
;

COMMENT ON TABLE  student21.payments                       IS 'Таблица платежей';
COMMENT ON COLUMN student21.payments.id                    IS 'Идентификатор платежа';
COMMENT ON COLUMN student21.payments.user_id               IS 'id пользователя, совершающего платеж';
COMMENT ON COLUMN student21.payments.created               IS 'Дата платежа';
COMMENT ON COLUMN student21.payments.status                IS 'Статус платежа';
COMMENT ON COLUMN student21.payments.book_id               IS 'id книги';

ALTER TABLE student21.payments ADD foreign key (user_id) REFERENCES student21.users_bookmarket(id);
ALTER TABLE student21.payments ADD foreign key (book_id) REFERENCES student21.books(id);