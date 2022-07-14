USE wits_lowy
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds an advisor
-- =============================================

CREATE PROCEDURE [dbo].[udp_addAdvisor] 
	(
	@advisor_first_name NVARCHAR(50),
    @advisor_last_name NVARCHAR(50),
	@advisor_email NVARCHAR(50)
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @advisor_id INT
	EXEC @advisor_id = dbo.udp_findAdvisor @advisor_email
  
	IF @advisor_id > 0
	BEGIN
		RETURN @advisor_id
	END

	INSERT INTO wits_lowy.advisor (
	
	advisor_first_name,
    advisor_last_name,
	advisor_email
	)
	VALUES(
	@advisor_first_name,
    @advisor_last_name,
	@advisor_email
	)
  
  EXEC @advisor_id = dbo.udp_findAdvisor @advisor_email
  RETURN @advisor_id

END
GO