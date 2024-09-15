CREATE TABLE IF NOT EXISTS student21.music_albums();


ALTER TABLE IF EXISTS student21.music_albums
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_music_album PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS release_date               DATE,
    ADD COLUMN IF NOT EXISTS artist_id                  BIGSERIAL
;

COMMENT ON TABLE  student21.music_albums                            IS 'Таблица с музыкальными альбомами';
COMMENT ON COLUMN student21.music_albums.id                         IS 'Идентификатор музыкального альбома';
COMMENT ON COLUMN student21.music_albums.name                       IS 'Имя музыкального альбома';
COMMENT ON COLUMN student21.music_albums.release_date               IS 'Дата выхода музыкального альбома';
COMMENT ON COLUMN student21.music_albums.artist_id                  IS 'id испольнителя, который его создал';

ALTER TABLE student21.music_albums ADD foreign key (artist_id) REFERENCES student21.music_artists(id);
