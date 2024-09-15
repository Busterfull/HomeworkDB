CREATE TABLE IF NOT EXISTS student21.countries();


ALTER TABLE IF EXISTS student21.countries
    ADD COLUMN IF NOT EXISTS ID                        BIGSERIAL CONSTRAINT pk_countries PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS country_code              SMALLINT,
    ADD COLUMN IF NOT EXISTS name                      VARCHAR
;

COMMENT ON TABLE  student21.countries                            IS 'Таблица со странами';
COMMENT ON COLUMN student21.countries.country_code               IS 'Код страны';
COMMENT ON COLUMN student21.countries.name                       IS 'Имя страны';