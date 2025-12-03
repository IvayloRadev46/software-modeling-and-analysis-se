INSERT INTO USERS (Email, Password, FullName, Country, SignupDate, IsActive) VALUES
('ivan.petrov@mail.com', 'pass123', 'Ivan Petrov', 'Bulgaria', '2023-01-12', 1),
('maria.dimitrova@mail.com', 'pass456', 'Maria Dimitrova', 'Bulgaria', '2023-02-18', 1),
('john.smith@mail.com', 'qwerty', 'John Smith', 'USA', '2022-11-03', 1),
('lisa.johnson@mail.com', 'secret', 'Lisa Johnson', 'UK', '2023-03-01', 1),
('georgi.ivanov@mail.com', 'pass789', 'Georgi Ivanov', 'Bulgaria', '2023-01-30', 1),
('anna.morris@mail.com', 'helloworld', 'Anna Morris', 'Canada', '2022-12-22', 1),
('stefan.kolev@mail.com', 'mypassword', 'Stefan Kolev', 'Bulgaria', '2023-04-11', 1),
('tom.hardy@mail.com', 'password', 'Tom Hardy', 'USA', '2023-02-05', 1),
('diana.nikolova@mail.com', '123456', 'Diana Nikolova', 'Bulgaria', '2023-01-20', 1),
('sarah.connor@mail.com', 'terminator', 'Sarah Connor', 'USA', '2022-10-10', 1);

INSERT INTO GENRES (Name) VALUES
('Fantasy'),
('Science Fiction'),
('Romance'),
('Thriller'),
('Horror'),
('Biography'),
('Self-help'),
('History'),
('Drama'),
('Children');

INSERT INTO LANGUAGE (Name) VALUES
('English'),
('Bulgarian'),
('German'),
('Spanish'),
('French');

INSERT INTO AUTHORS (FullName, Bio, Country) VALUES
('J. K. Rowling', 'British author of Harry Potter.', 'UK'),
('Stephen King', 'Master of horror and suspense.', 'USA'),
('George R. R. Martin', 'Author of A Song of Ice and Fire.', 'USA'),
('Paulo Coelho', 'Brazilian novelist and lyricist.', 'Brazil'),
('Agatha Christie', 'Writer of detective novels.', 'UK'),
('Suzanne Collins', 'Author of The Hunger Games.', 'USA'),
('Dan Brown', 'Thriller author.', 'USA'),
('J. R. R. Tolkien', 'Author of The Lord of the Rings.', 'UK'),
('Jo Nesbo', 'Norwegian crime novelist.', 'Norway'),
('Leo Tolstoy', 'Russian writer.', 'Russia');

INSERT INTO FORMATS (Name) VALUES
('Audiobook'),
('Ebook'),
('PDF'),
('Hardcover'),
('Softcover');

INSERT INTO BOOKS (Title, Description, ISBN, GenreId, LanguageId, PublishDate, Pages, Duration, CoverUrl, AverageRating) VALUES
('Harry Potter and the Sorcerer''s Stone', 'First book of Harry Potter.', '9780747532699', 1, 1, '1997-06-26', 309, 480, NULL, 4.8),
('The Shining', 'Horror novel by Stephen King.', '9780385121675', 5, 1, '1977-01-28', 447, 620, NULL, 4.7),
('A Game of Thrones', 'Book 1 of ASOIAF.', '9780553103540', 1, 1, '1996-08-06', 694, 900, NULL, 4.9),
('The Alchemist', 'Novel about destiny and dreams.', '9780061122415', 7, 1, '1988-05-01', 208, 300, NULL, 4.5),
('Murder on the Orient Express', 'Detective novel.', '9780007119318', 4, 1, '1934-01-01', 256, 400, NULL, 4.6),
('The Hunger Games', 'Dystopian novel.', '9780439023481', 2, 1, '2008-09-14', 374, 550, NULL, 4.8),
('The Hobbit', 'Fantasy novel by Tolkien.', '9780345339683', 1, 1, '1937-09-21', 310, 420, NULL, 4.9),
('Carrie', 'Horror by Stephen King.', '9780385086950', 5, 1, '1974-04-05', 199, 360, NULL, 4.3),
('It', 'Horror novel.', '9781501142970', 5, 1, '1986-09-15', 1138, 1200, NULL, 4.7),
('Inferno', 'Thriller by Dan Brown.', '9780385537858', 4, 1, '2013-05-14', 480, 690, NULL, 4.4),
('The Lord of the Rings', 'Epic fantasy trilogy.', '9780618640157', 1, 1, '1954-07-29', 1178, 1400, NULL, 4.9),
('Misery', 'Novel about obsession.', '9780670813643', 5, 1, '1987-06-08', 320, 500, NULL, 4.6),
('Animal Farm', 'Political satire.', '9780451526342', 9, 1, '1945-08-17', 112, 180, NULL, 4.4),
('The Da Vinci Code', 'Mystery thriller.', '9780307474278', 4, 1, '2003-03-18', 489, 600, NULL, 4.5),
('The Silmarillion', 'Lore of Middle-earth.', '9780618391111', 1, 1, '1977-09-15', 365, 540, NULL, 4.7),
('The Stand', 'Post-apocalyptic horror.', '9780385121682', 5, 1, '1978-10-03', 823, 950, NULL, 4.8),
('Doctor Sleep', 'Sequel to The Shining.', '9781451698855', 5, 1, '2013-09-24', 531, 700, NULL, 4.5),
('A Clash of Kings', 'Book 2 of ASOIAF.', '9780553108033', 1, 1, '1998-11-16', 768, 1020, NULL, 4.8),
('The Girl with the Dragon Tattoo', 'Crime thriller.', '9780307454546', 4, 1, '2005-08-01', 672, 840, NULL, 4.6),
('The Fault in Our Stars', 'Contemporary romance.', '9780525478812', 3, 1, '2012-01-10', 313, 420, NULL, 4.5);

INSERT INTO BOOKAUTHORS (BookId, AuthorId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 8),
(8, 2),
(9, 2),
(10, 7),
(11, 8),
(12, 2),
(13, 10),
(14, 7),
(15, 8),
(16, 2),
(17, 2),
(18, 3),
(19, 9),
(20, 4);

INSERT INTO BOOKFORMATS (FormatId, BookId) VALUES
(1, 1), (2, 1),
(1, 2), (2, 2),
(1, 3), (2, 3),
(1, 4), (2, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20);

INSERT INTO SUBSCRIPTIONS (UserId, Type, StartDate, EndDate, Status) VALUES
(1, 'Premium', '2023-01-12', NULL, 'Active'),
(2, 'Premium', '2023-02-18', NULL, 'Active'),
(3, 'Standard', '2022-11-03', '2023-11-03', 'Expired'),
(4, 'Premium', '2023-03-01', NULL, 'Active'),
(5, 'Standard', '2023-01-30', '2023-06-30', 'Expired');
(6, 'Premium',  '2022-12-22', NULL,'Active'),
(7, 'Standard', '2023-04-11', NULL,'Active'),
(8, 'Premium',  '2023-02-05', NULL, 'Active'),
(9, 'Premium',  '2023-01-20', '2023-07-20','Expired'),
(10,'Standard', '2022-10-10', NULL, 'Active');

INSERT INTO PAYMENTS (SubscriptionId, Amount, Currency, PaidAt, Provider) VALUES
(1, 14.99, 'USD', '2023-01-12', 'Stripe'),
(2, 14.99, 'USD', '2023-02-18', 'PayPal'),
(3, 9.99, 'USD', '2022-11-03', 'Visa'),
(4, 14.99, 'USD', '2023-03-01', 'MasterCard'),
(5, 9.99, 'USD', '2023-01-30', 'Stripe');
(6, 14.99, 'USD', '2022-12-22', 'Stripe'),
(7,  9.99, 'USD', '2023-04-11', 'PayPal'),
(8, 14.99, 'USD', '2023-02-05', 'Visa'),
(9, 14.99, 'USD', '2023-01-20', 'MasterCard'),
(10, 9.99, 'USD', '2022-10-10', 'Stripe');

INSERT INTO REVIEWS (UserId, BookId, Rating, Comment, CreatedAt, IsActive) VALUES
(1, 1, 5, 'Amazing book!', '2023-01-15', 1),
(2, 3, 5, 'Epic story.', '2023-02-20', 1),
(3, 2, 4, 'Creepy but good.', '2022-11-05', 1),
(4, 4, 5, 'Inspirational.', '2023-03-03', 1),
(5, 5, 4, 'Classic detective tale.', '2023-02-01', 1);
(6, 6, 5, 'Really enjoyed the dystopian setting.','2023-02-26', 1),
(7, 7, 5, 'Classic fantasy adventure, loved it.','2023-04-15', 1),
(8, 8, 3, 'Interesting story but a bit slow.','2023-02-07', 1),
(9, 9, 4, 'Creepy and intense, but very long.','2023-03-10', 1),
(10, 10, 4, 'Great thriller, kept me hooked.','2023-02-12', 1),
(1, 2, 4, 'Good horror, not my absolute favorite.','2023-01-20', 1),
(2, 1, 5, 'Harry Potter is always a joy to read.','2023-02-25', 1),
(3, 3, 5, 'Even better than the show!','2022-11-10', 1),
(4, 6, 4, 'Nice YA story, very engaging.','2023-03-10', 1),
(5, 7, 5, 'Epic fantasy world-building.','2023-02-15', 1);

INSERT INTO USERACTIVITY (UserId, BookId, Position, LastListenedAt) VALUES
(1, 1, 120, '2023-01-15'),
(2, 3, 450, '2023-02-20'),
(3, 2, 300, '2022-11-06'),
(4, 4, 150, '2023-03-04'),
(5, 6, 200, '2023-01-31');


