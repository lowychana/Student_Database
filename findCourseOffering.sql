USE wits_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds course_offering
-- =============================================
CREATE PROCEDURE [dbo].[udp_findCourseOffering] (
	@course_id INT,
	@day VARCHAR (50),
	@time VARCHAR (50)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @course_offering_id INT
    SET @course_offering_id = 0
    SET @course_offering_id = (SELECT TOP 1 course_offering_id
                     FROM wits_lowy.course_offering
					 WHERE @course_id = course_id AND @day = day AND @time = time)
   IF @course_offering_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @course_offering_id

END
GO

