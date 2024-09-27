SELECT ab, AVG(b.count_downloads) FROM student21.books b
    INNER JOIN student21.authors_books ab ON b.author_id = ab.id
GROUP BY ab