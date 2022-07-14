USE wits_lowy
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds a course offering
-- =============================================

CREATE PROCEDURE [dbo].[udp_addCourseOffering] 
	(
	@course_id INT,
	@instructor_id INT,
	@semester NVARCHAR (50),
	@time NVARCHAR (50),
	@day NVARCHAR (50),
	@year NVARCHAR (50),
	@room_number NVARCHAR (50)
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @course_offering_id INT
	EXEC @course_offering_id = dbo.udp_findCourseOffering @course_id, @day, @time
  
	IF @course_offering_id > 0
	BEGIN
		RETURN @course_offering_id
	END

	INSERT INTO wits_lowy.course_offering (
	course_id,
	instructor_id,
	semester,
	time,
	day,
	year,
	room_number
	)
	VALUES(
	@course_id,
	@instructor_id,
	@semester,
	@time,
	@day,
	@year,
	@room_number
	)
  
  EXEC @course_offering_id = dbo.udp_findCourseOffering @course_id, @day, @time
  RETURN @course_offering_id

END
GO