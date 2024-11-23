-- Enable the isn extension
CREATE EXTENSION IF NOT EXISTS isn;

-- Create a table for books with ISBN
CREATE TABLE isn_table (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn ISBN13 NOT NULL,  -- Using ISBN13 type from isn extension
    author VARCHAR(255),
    publication_year INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO isn_table (title, isbn, author, publication_year) VALUES
    ('The Hobbit', '9780547928227', 'J.R.R. Tolkien', 1937),
    ('1984', '9780451524935', 'George Orwell', 1949),
    ('Pride and Prejudice', '9780141439518', 'Jane Austen', 1813),
    ('To Kill a Mockingbird', '9780446310789', 'Harper Lee', 1960),
    ('The Catcher in the Rye', '9780316769488', 'J.D. Salinger', 1951),
    ('The Great Gatsby', '9780743273565', 'F. Scott Fitzgerald', 1925),
    ('One Hundred Years of Solitude', '9780060883287', 'Gabriel García Márquez', 1967),
    ('Brave New World', '9780060850524', 'Aldous Huxley', 1932),
    ('The Lord of the Rings', '9780618640157', 'J.R.R. Tolkien', 1954),
    ('Crime and Punishment', '9780143058144', 'Fyodor Dostoevsky', 1866),
    ('The Grapes of Wrath', '9780143039433', 'John Steinbeck', 1939),
    ('The Odyssey', '9780140268867', 'Homer', -800),
    ('Don Quixote', '9780142437230', 'Miguel de Cervantes', 1605),
    ('War and Peace', '9780140447934', 'Leo Tolstoy', 1869),
    ('Moby Dick', '9780142437247', 'Herman Melville', 1851),
    ('Jane Eyre', '9780141441146', 'Charlotte Brontë', 1847),
    ('The Divine Comedy', '9780142437223', 'Dante Alighieri', 1320),
    ('Animal Farm', '9780451526342', 'George Orwell', 1945),
    ('The Brothers Karamazov', '9780374528379', 'Fyodor Dostoevsky', 1880),
    ('Les Misérables', '9780140444308', 'Victor Hugo', 1862),
    ('The Picture of Dorian Gray', '9780141439570', 'Oscar Wilde', 1890),
    ('Wuthering Heights', '9780141439556', 'Emily Brontë', 1847),
    ('The Count of Monte Cristo', '9780140449266', 'Alexandre Dumas', 1844),
    ('Heart of Darkness', '9780141441672', 'Joseph Conrad', 1899),
    ('The Adventures of Huckleberry Finn', '9780142437179', 'Mark Twain', 1884),
    ('Anna Karenina', '9780143035008', 'Leo Tolstoy', 1877),
    ('The Scarlet Letter', '9780142437261', 'Nathaniel Hawthorne', 1850),
    ('The Iliad', '9780140275360', 'Homer', -800),
    ('Frankenstein', '9780141439471', 'Mary Shelley', 1818),
    ('The Canterbury Tales', '9780140424386', 'Geoffrey Chaucer', 1400),
    ('Dracula', '9780141439846', 'Bram Stoker', 1897),
    ('Great Expectations', '9780141439563', 'Charles Dickens', 1861),
    ('The Aeneid', '9780140446272', 'Virgil', -19),  -- Corrected ISBN
    ('The Tale of Genji', '9780142437148', 'Murasaki Shikibu', 1021),
    ('Paradise Lost', '9780140424393', 'John Milton', 1667),
    ('Oliver Twist', '9780141439747', 'Charles Dickens', 1838),
    ('The Republic', '9780140455113', 'Plato', -380),
    ('Beowulf', '9780140449310', 'Unknown', 1000),
    ('Faust', '9780140440126', 'Johann Wolfgang von Goethe', 1829),
    ('The Decameron', '9780140449303', 'Giovanni Boccaccio', 1353),
    ('Madame Bovary', '9780140449129', 'Gustave Flaubert', 1856),
    ('The Three Musketeers', '9780141442341', 'Alexandre Dumas', 1844),
    ('Robinson Crusoe', '9780141439822', 'Daniel Defoe', 1719),
    ('The Art of War', '9780140439199', 'Sun Tzu', -500);