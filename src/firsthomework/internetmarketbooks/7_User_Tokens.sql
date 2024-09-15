CREATE TABLE IF NOT EXISTS student21.users_tokens();


ALTER TABLE IF EXISTS student21.users_tokens
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_tokens PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS user_id                    BIGSERIAL,
    ADD COLUMN IF NOT EXISTS expiration_date            TIMESTAMP WITH TIME ZONE,
    ADD COLUMN IF NOT EXISTS token                      VARCHAR
;

COMMENT ON TABLE  student21.users_tokens                       IS 'Таблица токенов доступа к магазину книг';
COMMENT ON COLUMN student21.users_tokens.id                    IS 'Идентификатор токена';
COMMENT ON COLUMN student21.users_tokens.user_id               IS 'id пользователя';
COMMENT ON COLUMN student21.users_tokens.expiration_date       IS 'Дата действия токена';
COMMENT ON COLUMN student21.users_tokens.token                 IS 'Токен';

ALTER TABLE student21.users_tokens ADD foreign key (user_id) REFERENCES student21.users_bookmarket(id);