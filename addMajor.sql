USE wits_lowy
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds a major
-- =============================================

CREATE PROCEDURE [dbo].[udp_addMajor] 
	(
	@major_name NVARCHAR(50),
    @major_requirements NVARCHAR(50)
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @major_id INT
	EXEC @major_id = dbo.udp_findMajor @major_name
  
	IF @major_id > 0
	BEGIN
		RETURN @major_id
	END

	INSERT INTO wits_lowy.major (
	major_name,
	major_requirements
	)
	VALUES(
	@major_name,
	@major_requirements
	)
  
  EXEC @major_id = dbo.udp_findMajor @major_name
  RETURN @major_id

END
GO