CREATE TABLE IF NOT EXISTS student21.music_tracks();


ALTER TABLE IF EXISTS student21.music_tracks
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_music_tracks PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS album_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS file_id                    BIGSERIAL
;

COMMENT ON TABLE  student21.music_tracks                            IS 'Таблица с музыкальными альбомами';
COMMENT ON COLUMN student21.music_tracks.id                         IS 'Идентификатор музыкального трека';
COMMENT ON COLUMN student21.music_tracks.name                       IS 'Имя музыкального трека';
COMMENT ON COLUMN student21.music_tracks.album_id                   IS 'id альбома, в котором данный трек';
COMMENT ON COLUMN student21.music_tracks.file_id                    IS 'id файла в хранилище';

ALTER TABLE student21.music_tracks ADD foreign key (album_id) REFERENCES student21.music_albums(id);
