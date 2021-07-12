/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano/Renato Fontes $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (020) notifadm.pss_GenerateNotification.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('notifadm.pss_GenerateNotification') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure notifadm.pss_GenerateNotification
	as begin
		print ''Procedure created.'';
	end' );
end
GO

ALTER procedure [notifadm].[pss_GenerateNotification]

@QUERY nvarchar(max),
@SBPN_ID UDT_ID,
@NFEV_ID UDT_ID



as begin

	declare @NOTF_INFORMATION XML,
			@USER nvarchar(255),
			@DATE datetime,
			@PARAM nvarchar(255)

	select @QUERY='set @NOTF_INFORMATION=('+@QUERY+' for xml raw(''data''), root (''xmldata''))',
			@PARAM='@NOTF_INFORMATION XML OUTPUT',
			@USER=user,
			@DATE=getdate()

	EXEC SP_EXECUTESQL @QUERY,@PARAM,@NOTF_INFORMATION=@NOTF_INFORMATION OUTPUT

	if(@NOTF_INFORMATION IS NOT NULL)
	BEGIN
		EXEC	[notifadm].[pss_NOTF_IUD]
				@SESSION_ID = '0',
				@USER = @USER,
				@NOTF_ID = 0,
				@NOTF_USER = @USER,
				@NOTF_XPTS = @DATE,
				@AAKT_CODE = 10,
				@SBPN_ID = @SBPN_ID,
				@NFEV_ID = @NFEV_ID,
				@NOTF_INFORMATION = @NOTF_INFORMATION,
				@NOTF_ISSENT = 0
	END
END
