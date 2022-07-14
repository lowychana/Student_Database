USE wits_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds instructor
-- =============================================
CREATE PROCEDURE [dbo].[udp_findInstructor] (
	@instructor_email VARCHAR (50)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @instructor_id INT
    SET @instructor_id = 0
    SET @instructor_id = (SELECT TOP 1 instructor_id 
                     FROM wits_lowy.instructor
					 WHERE instructor_email = @instructor_email)
   IF @instructor_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @instructor_id

END
GO
