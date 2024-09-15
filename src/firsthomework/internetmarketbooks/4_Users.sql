CREATE TABLE IF NOT EXISTS student21.users_bookmarket();


ALTER TABLE IF EXISTS student21.users_bookmarket
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_user_bookmarket PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS login                      VARCHAR,
    ADD COLUMN IF NOT EXISTS password                   VARCHAR,
    ADD COLUMN IF NOT EXISTS firstname                  VARCHAR,
    ADD COLUMN IF NOT EXISTS middlename                 VARCHAR,
    ADD COLUMN IF NOT EXISTS lastname                   VARCHAR,
    ADD COLUMN IF NOT EXISTS country_id                 BIGSERIAL,
    ADD COLUMN IF NOT EXISTS bithday                    DATE,
    ADD COLUMN IF NOT EXISTS registration_date          DATE
;

COMMENT ON TABLE  student21.users_bookmarket                            IS 'Таблица с пользователями книжного магазина';
COMMENT ON COLUMN student21.users_bookmarket.id                         IS 'Идентификатор пользователя';
COMMENT ON COLUMN student21.users_bookmarket.login                      IS 'Логин пользователя';
COMMENT ON COLUMN student21.users_bookmarket.password                   IS 'Пароль пользователя';
COMMENT ON COLUMN student21.users_bookmarket.firstname                  IS 'Имя пользователя';
COMMENT ON COLUMN student21.users_bookmarket.middlename                 IS 'Отчество пользователя';
COMMENT ON COLUMN student21.users_bookmarket.lastname                   IS 'Фамилия пользователя';
COMMENT ON COLUMN student21.users_bookmarket.country_id                 IS 'id страны пользователя';
COMMENT ON COLUMN student21.users_bookmarket.bithday                    IS 'День рождения пользователя';
COMMENT ON COLUMN student21.users_bookmarket.registration_date          IS 'Дата регистрации';

ALTER TABLE student21.users_bookmarket ADD foreign key (country_id) REFERENCES student21.countries(id);