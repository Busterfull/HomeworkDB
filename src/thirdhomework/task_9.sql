SELECT ab, ab.count_books FROM student21.books b
    INNER JOIN student21.authors_books ab ON b.author_id = ab.id
GROUP BY ab, ab.count_books