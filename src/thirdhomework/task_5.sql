SELECT SUM(b.count_downloads) FROM student21.books b
    INNER JOIN student21.books_genres bg ON b.id = bg.book_id
    INNER JOIN student21.book_genres gen on gen.id = bg.genre_id
WHERE gen.name = 'Исторический роман'