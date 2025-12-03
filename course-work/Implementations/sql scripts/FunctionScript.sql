CREATE FUNCTION dbo.fn_GetBookAverageRating (@BookId INT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @Result DECIMAL(3,2);
    SELECT @Result = AVG(CAST(Rating AS DECIMAL(3,2)))
    FROM Reviews
    WHERE BookId = @BookId
      AND IsActive = 1;
    IF @Result IS NULL
        SET @Result = 0;
    RETURN @Result;
END;
GO

SELECT dbo.fn_GetBookAverageRating(1) AS AvgRating;