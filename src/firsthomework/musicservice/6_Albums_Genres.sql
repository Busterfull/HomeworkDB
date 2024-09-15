CREATE TABLE IF NOT EXISTS student21.albums_genres();


ALTER TABLE IF EXISTS student21.albums_genres
    ADD COLUMN IF NOT EXISTS ID                        BIGSERIAL CONSTRAINT pk_albums_genres PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS album_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS genre_id                  BIGSERIAL
;

COMMENT ON TABLE  student21.albums_genres                          IS 'Таблица взаимодействия альбомов и жанров';
COMMENT ON COLUMN student21.albums_genres.album_id                 IS 'id альбома';
COMMENT ON COLUMN student21.albums_genres.genre_id                 IS 'id жанра';

ALTER TABLE student21.albums_genres ADD foreign key (album_id) REFERENCES student21.music_albums(id);
ALTER TABLE student21.albums_genres ADD foreign key (genre_id) REFERENCES student21.music_genres(id);