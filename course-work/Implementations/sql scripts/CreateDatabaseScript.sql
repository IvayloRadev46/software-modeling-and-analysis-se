CREATE DATABASE Storytel1DB;
GO
USE Storytel1DB;
GO
CREATE TABLE USERS (
    UserId      INT IDENTITY(1,1),
    Email       NVARCHAR(100),
    Password    NVARCHAR(100),
    FullName    NVARCHAR(100),
    Country     NVARCHAR(100),
    SignupDate  DATETIME,
    IsActive    BIT,
    CONSTRAINT PK_Users PRIMARY KEY (UserId),
    CONSTRAINT NN01_Users_Email      CHECK (Email IS NOT NULL),
    CONSTRAINT NN02_Users_Password   CHECK (Password IS NOT NULL),
    CONSTRAINT NN03_Users_FullName   CHECK (FullName IS NOT NULL),
    CONSTRAINT NN04_Users_SignupDate CHECK (SignupDate IS NOT NULL),
    CONSTRAINT NN05_Users_IsActive   CHECK (IsActive IS NOT NULL),
    CONSTRAINT UQ01_Users_Email      UNIQUE (Email)
);

CREATE TABLE GENRES (
    GenreId INT IDENTITY(1,1),
    Name    NVARCHAR(100),
    CONSTRAINT PK_Genres PRIMARY KEY (GenreId),
    CONSTRAINT NN01_Genres_Name CHECK (Name IS NOT NULL)
);

CREATE TABLE LANGUAGE (
    LanguageId INT IDENTITY(1,1),
    Name       NVARCHAR(100),
    CONSTRAINT PK_Language PRIMARY KEY (LanguageId),
    CONSTRAINT NN01_Language_Name CHECK (Name IS NOT NULL)
);

CREATE TABLE AUTHORS (
    AuthorId INT IDENTITY(1,1),
    FullName NVARCHAR(100),
    Bio      NVARCHAR(MAX),
    Country  NVARCHAR(100),
    CONSTRAINT PK_Authors PRIMARY KEY (AuthorId),
    CONSTRAINT NN01_Authors_FullName CHECK (FullName IS NOT NULL),
    CONSTRAINT NN02_Authors_Country  CHECK (Country IS NOT NULL)
);

CREATE TABLE FORMATS (
    FormatId INT IDENTITY(1,1),
    Name     NVARCHAR(100),
    CONSTRAINT PK_Formats PRIMARY KEY (FormatId),
    CONSTRAINT NN01_Formats_Name CHECK (Name IS NOT NULL)
);

CREATE TABLE BOOKS (
    BookId        INT IDENTITY(1,1),
    Title         NVARCHAR(100),
    Description   NVARCHAR(MAX),
    ISBN          NVARCHAR(50),
    GenreId       INT,
    LanguageId    INT,
    PublishDate   DATE,
    Pages         INT,
    Duration      INT,
    CoverUrl      NVARCHAR(500),
    AverageRating DECIMAL(3,2),
    CONSTRAINT PK_Books PRIMARY KEY (BookId),
    CONSTRAINT FK01_Books_Genres    FOREIGN KEY (GenreId)    REFERENCES GENRES(GenreId),
    CONSTRAINT FK02_Books_Language  FOREIGN KEY (LanguageId) REFERENCES LANGUAGE(LanguageId),
    CONSTRAINT NN01_Books_Title     CHECK (Title IS NOT NULL),
    CONSTRAINT NN02_Books_Genre     CHECK (GenreId IS NOT NULL),
    CONSTRAINT NN03_Books_Language  CHECK (LanguageId IS NOT NULL),
    CONSTRAINT CK01_Books_Pages     CHECK (Pages IS NULL OR Pages > 0),
    CONSTRAINT CK02_Books_Duration  CHECK (Duration IS NULL OR Duration > 0),
    CONSTRAINT CK03_Books_AvgRating CHECK (AverageRating IS NULL OR (AverageRating >= 0 AND AverageRating <= 5))
);

CREATE TABLE BOOKAUTHORS (
    BookId   INT,
    AuthorId INT,
    CONSTRAINT PK_BookAuthors PRIMARY KEY (BookId, AuthorId),
    CONSTRAINT FK01_BookAuthors_Books   FOREIGN KEY (BookId)   REFERENCES BOOKS(BookId)   ON DELETE CASCADE,
    CONSTRAINT FK02_BookAuthors_Authors FOREIGN KEY (AuthorId) REFERENCES AUTHORS(AuthorId) ON DELETE CASCADE,
    CONSTRAINT NN01_BookAuthors_Book   CHECK (BookId IS NOT NULL),
    CONSTRAINT NN02_BookAuthors_Author CHECK (AuthorId IS NOT NULL)
);

CREATE TABLE BOOKFORMATS (
    FormatId INT,
    BookId   INT,
    CONSTRAINT PK_BookFormats PRIMARY KEY (FormatId, BookId),
    CONSTRAINT FK01_BookFormats_Formats FOREIGN KEY (FormatId) REFERENCES FORMATS(FormatId) ON DELETE CASCADE,
    CONSTRAINT FK02_BookFormats_Books   FOREIGN KEY (BookId)   REFERENCES BOOKS(BookId)   ON DELETE CASCADE,
    CONSTRAINT NN01_BookFormats_Format CHECK (FormatId IS NOT NULL),
    CONSTRAINT NN02_BookFormats_Book   CHECK (BookId IS NOT NULL)
);

CREATE TABLE SUBSCRIPTIONS (
    SubscriptionId INT IDENTITY(1,1),
    UserId         INT,
    Type           NVARCHAR(50),
    StartDate      DATE,
    EndDate        DATE,
    Status         NVARCHAR(50),
    CONSTRAINT PK_Subscriptions PRIMARY KEY (SubscriptionId),
    CONSTRAINT FK01_Subscriptions_Users FOREIGN KEY (UserId) REFERENCES USERS(UserId),
    CONSTRAINT NN01_Subscriptions_User   CHECK (UserId IS NOT NULL),
    CONSTRAINT NN02_Subscriptions_Type   CHECK (Type IS NOT NULL),
    CONSTRAINT NN03_Subscriptions_Start  CHECK (StartDate IS NOT NULL),
    CONSTRAINT NN04_Subscriptions_Status CHECK (Status IS NOT NULL),
    CONSTRAINT CK01_Subscriptions_Dates  CHECK (EndDate IS NULL OR EndDate >= StartDate)
);

CREATE TABLE PAYMENTS (
    PaymentId      INT IDENTITY(1,1),
    SubscriptionId INT,
    Amount         DECIMAL(10,2),
    Currency       NVARCHAR(10),
    PaidAt         DATETIME,
    Provider       NVARCHAR(100),
    CONSTRAINT PK_Payments PRIMARY KEY (PaymentId),
    CONSTRAINT FK01_Payments_Subscriptions FOREIGN KEY (SubscriptionId) REFERENCES SUBSCRIPTIONS(SubscriptionId),
    CONSTRAINT NN01_Payments_Subscription CHECK (SubscriptionId IS NOT NULL),
    CONSTRAINT NN02_Payments_Amount       CHECK (Amount IS NOT NULL AND Amount > 0),
    CONSTRAINT NN03_Payments_Currency     CHECK (Currency IS NOT NULL),
    CONSTRAINT NN04_Payments_PaidAt       CHECK (PaidAt IS NOT NULL),
    CONSTRAINT NN05_Payments_Provider     CHECK (Provider IS NOT NULL)
);

CREATE TABLE REVIEWS (
    ReviewId  INT IDENTITY(1,1),
    UserId    INT,
    BookId    INT,
    Rating    INT,
    Comment   NVARCHAR(1000),
    CreatedAt DATE,
    IsActive  BIT,
    CONSTRAINT PK_Reviews PRIMARY KEY (ReviewId),
    CONSTRAINT FK01_Reviews_Users FOREIGN KEY (UserId) REFERENCES USERS(UserId),
    CONSTRAINT FK02_Reviews_Books FOREIGN KEY (BookId) REFERENCES BOOKS(BookId),
    CONSTRAINT NN01_Reviews_User     CHECK (UserId IS NOT NULL),
    CONSTRAINT NN02_Reviews_Book     CHECK (BookId IS NOT NULL),
    CONSTRAINT NN03_Reviews_Rating   CHECK (Rating IS NOT NULL),
    CONSTRAINT NN04_Reviews_Created  CHECK (CreatedAt IS NOT NULL),
    CONSTRAINT NN05_Reviews_IsActive CHECK (IsActive IS NOT NULL),
    CONSTRAINT CK01_Reviews_Rating   CHECK (Rating BETWEEN 1 AND 5)
	ADD CONSTRAINT UQ_Reviews_User_Book UNIQUE (UserId, BookId);
);

CREATE TABLE USERACTIVITY (
    UserActivityId INT IDENTITY(1,1),
    UserId         INT,
    BookId         INT,
    Position       INT,
    LastListenedAt DATETIME,
    CONSTRAINT PK_UserActivity PRIMARY KEY (UserActivityId),
    CONSTRAINT FK01_UserActivity_Users FOREIGN KEY (UserId) REFERENCES USERS(UserId),
    CONSTRAINT FK02_UserActivity_Books FOREIGN KEY (BookId) REFERENCES BOOKS(BookId),
    CONSTRAINT NN01_UserActivity_User CHECK (UserId IS NOT NULL),
    CONSTRAINT NN02_UserActivity_Book CHECK (BookId IS NOT NULL),
    CONSTRAINT CK01_UserActivity_Pos  CHECK (Position IS NULL OR Position >= 0)
);




