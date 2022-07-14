USE wits_lowy
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds a course
-- =============================================

CREATE PROCEDURE [dbo].[udp_addCourse] 
	(
	@course_name NVARCHAR(50),
    @course_description NVARCHAR(50)
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @course_id INT
	EXEC @course_id = dbo.udp_findCourse @course_name
  
	IF @course_id > 0
	BEGIN
		RETURN @course_id
	END

	INSERT INTO wits_lowy.course (
	course_name,
	course_description
	)
	VALUES(
	@course_name,
	@course_description
	)
  
  EXEC @course_id = dbo.udp_findCourse @course_name
  RETURN @course_id

END
GO