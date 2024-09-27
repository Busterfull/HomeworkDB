SELECT gen.name, b FROM student21.books b
    RIGHT JOIN student21.books_genres bg ON b.id = bg.book_id
    RIGHT JOIN student21.book_genres gen on gen.id = bg.genre_id
WHERE b IS NULL
