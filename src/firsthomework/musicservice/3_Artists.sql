CREATE TABLE IF NOT EXISTS student21.music_artists();


ALTER TABLE IF EXISTS student21.music_artists
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_music_artist PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS firstname                  VARCHAR,
    ADD COLUMN IF NOT EXISTS middlename                 VARCHAR,
    ADD COLUMN IF NOT EXISTS lastname                   VARCHAR,
    ADD COLUMN IF NOT EXISTS country_id                 BIGSERIAL,
    ADD COLUMN IF NOT EXISTS bithday                    DATE
;

COMMENT ON TABLE  student21.music_artists                            IS 'Таблица с музыкальными исполнителями';
COMMENT ON COLUMN student21.music_artists.id                         IS 'Идентификатор музыкального исполнителя';
COMMENT ON COLUMN student21.music_artists.firstname                  IS 'Имя музыкального исполнителя';
COMMENT ON COLUMN student21.music_artists.middlename                 IS 'Отчество музыкального исполнителя';
COMMENT ON COLUMN student21.music_artists.lastname                   IS 'Фамилия музыкального исполнителя';
COMMENT ON COLUMN student21.music_artists.country_id                 IS 'id страны музыкального исполнителя';
COMMENT ON COLUMN student21.music_artists.bithday                    IS 'Дата рождения музыкального исполнителя';

ALTER TABLE student21.music_artists ADD foreign key (country_id) REFERENCES student21.countries(id);