CREATE TRIGGER TR_UpdateBookRating
ON Reviews
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BookId INT;

    SELECT TOP 1 @BookId = BookId FROM inserted;
    IF @BookId IS NULL
        SELECT TOP 1 @BookId = BookId FROM deleted;

    UPDATE Books
    SET AverageRating =
        (SELECT AVG(CAST(Rating AS DECIMAL(3,2))) 
         FROM Reviews 
         WHERE BookId = @BookId AND IsActive = 1)
    WHERE BookId = @BookId;
END;
GO

SELECT AverageRating AS BeforeTrigger
FROM Books
WHERE BookId = 1;

INSERT INTO Reviews (UserId, BookId, Rating, Comment, CreatedAt, IsActive)
VALUES (1, 1, 5, 'Trigger test', GETDATE(), 1);

SELECT AverageRating AS AfterTrigger
FROM Books
WHERE BookId = 1;

SELECT dbo.fn_GetBookAverageRating(1) AS FunctionValue;
