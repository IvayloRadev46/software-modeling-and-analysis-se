CREATE PROCEDURE CreateReview
    @UserId INT,
    @BookId INT,
    @Rating INT,
    @Comment NVARCHAR(1000),
    @Position INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewReviewId INT;
    DECLARE @NewAverage DECIMAL(3,2);
    DECLARE @Now DATETIME = GETDATE();

    IF @Rating < 1 OR @Rating > 5
    BEGIN
        RAISERROR('Rating must be between 1 and 5.', 16, 1);
        RETURN;
    END;

	IF EXISTS (
    SELECT 1 
    FROM Reviews 
    WHERE UserId = @UserId AND BookId = @BookId
)
BEGIN
    RAISERROR ('You already reviewed this book.', 16, 1);
    RETURN;
END


    INSERT INTO Reviews (UserId, BookId, Rating, Comment, CreatedAt, IsActive)
    VALUES (@UserId, @BookId, @Rating, @Comment, CAST(@Now AS DATE), 1);

    SET @NewReviewId = SCOPE_IDENTITY();

    SELECT @NewAverage = AVG(CAST(Rating AS DECIMAL(3,2)))
    FROM Reviews
    WHERE BookId = @BookId AND IsActive = 1;

    UPDATE Books
    SET AverageRating = @NewAverage
    WHERE BookId = @BookId;

    IF EXISTS (SELECT 1 FROM UserActivity WHERE UserId = @UserId AND BookId = @BookId)
    BEGIN
        UPDATE UserActivity
        SET Position = @Position,
            LastListenedAt = @Now
        WHERE UserId = @UserId AND BookId = @BookId;
    END
    ELSE
    BEGIN
        INSERT INTO UserActivity (UserId, BookId, Position, LastListenedAt)
        VALUES (@UserId, @BookId, @Position, @Now);
    END

    SELECT 
        r.ReviewId,
        r.UserId,
        u.FullName AS UserFullName,
        r.BookId,
        b.Title AS BookTitle,
        r.Rating,
        r.Comment,
        r.CreatedAt,
        ua.Position,
        ua.LastListenedAt,
        b.AverageRating
    FROM Reviews r
    JOIN Users u ON u.UserId = r.UserId
    JOIN Books b ON b.BookId = r.BookId
    JOIN UserActivity ua ON ua.UserId = r.UserId AND ua.BookId = r.BookId
    WHERE r.ReviewId = @NewReviewId;
END;
GO


EXEC CreateReview 
    @UserId = 3,
    @BookId = 1,
    @Rating = 5,
    @Comment = 'A very interesting book',
    @Position = 3200;

