SELECT b, gen.name FROM student21.books b
    INNER JOIN student21.books_genres bg ON b.id = bg.book_id
    INNER JOIN student21.book_genres gen on gen.id = bg.genre_id
GROUP BY b, gen.name;

SELECT b, gen.name FROM student21.books b
    LEFT OUTER JOIN student21.books_genres bg ON b.id = bg.book_id
    LEFT OUTER JOIN student21.book_genres gen on gen.id = bg.genre_id
GROUP BY b, gen.name;

SELECT b, gen.name FROM student21.books b
    RIGHT OUTER JOIN student21.books_genres bg ON b.id = bg.book_id
    RIGHT OUTER JOIN student21.book_genres gen on gen.id = bg.genre_id
GROUP BY b, gen.name;

SELECT b, gen.name FROM student21.books b
    FULL JOIN student21.books_genres bg ON b.id = bg.book_id
    FULL JOIN student21.book_genres gen on gen.id = bg.genre_id
GROUP BY b, gen.name;