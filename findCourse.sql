USE school_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds course
-- =============================================
CREATE PROCEDURE [dbo].[udp_findCourse] (
	@course_name VARCHAR (50)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @course_id INT
    SET @course_id = 0
    SET @course_id = (SELECT TOP 1 course_id 
                     FROM school_lowy.course
					 WHERE course_name = @course_name)
   IF @course_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @course_id

END
GO
