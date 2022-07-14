USE [wits_lowy]
GO

/****** Object:  StoredProcedure [dbo].[udp_addEnrollment]    Script Date: 5/13/2022 5:50:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds an enrollment
-- =============================================

CREATE PROCEDURE [dbo].[udp_addEnrollment] 
	(
	@course_offering_id INT,
	@student_id INT,
	@grade INT
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @enrollment_id INT
	EXEC @enrollment_id = dbo.udp_findEnrollment @course_offering_id, @student_id
  
	IF @enrollment_id > 0
	BEGIN
		RETURN @enrollment_id
	END

	INSERT INTO wits_lowy.enrollment (
	course_offering_id,
	student_id,
	grade
	)
	VALUES(
	@course_offering_id,
	@student_id,
	@grade
	)
  
  EXEC @enrollment_id = dbo.udp_findEnrollment @course_offering_id, @student_id
  RETURN @enrollment_id

END
GO


