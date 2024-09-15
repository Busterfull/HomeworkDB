CREATE TABLE IF NOT EXISTS student21.music_genres();


ALTER TABLE IF EXISTS student21.music_genres
    ADD COLUMN IF NOT EXISTS ID                         BIGSERIAL CONSTRAINT pk_genres PRIMARY KEY,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  student21.music_genres                      IS 'Таблица жанрами музыки';
COMMENT ON COLUMN student21.music_genres.id                   IS 'Идентификатор жанра';
COMMENT ON COLUMN student21.music_genres.name                 IS 'Имя жанра';