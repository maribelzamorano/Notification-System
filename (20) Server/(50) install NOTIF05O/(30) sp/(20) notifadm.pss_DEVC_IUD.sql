/*	
 * topdev GmbH, erstellt am 15.01.2010 14:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (20) notifadm.pss_DEVC_IUD.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('notifadm.pss_DEVC_IUD') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure notifadm.pss_DEVC_IUD
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure notifadm.pss_DEVC_IUD
	@SESSION_ID	UDT_SESSION_ID,		
	@USER		UDT_USER,			

	@DEVC_ID	UDT_ID output,		
	@DEVC_USER	nvarchar(128),		
	@DEVC_XPTS	nvarchar(23),		

	@AAKT_CODE	smallint,			

--> business fields
	@SBER_ID			UDT_ID	= NULL,
	@CMMD_CODE			UDT_ID	= NULL,

	@DEVC_ADDRESS		nvarchar(255) = NULL,

-->

	@KZ_USE_TRANSACTION	bit = 0,	
	@DEBUG				bit = 0		

as begin


	set nocount on;

	declare	@rc			integer,
			@rc_text	nvarchar(1000),
			@sql_error	integer,
			@procName	nvarchar(250),
			@step		nvarchar(100),

			@id				UDT_ID,
			@tbsh_shortname	UDT_TABLENAME_SHORT,
			@uqid			UDT_UQID,
			@pts			datetime,
			@b				bit;
 

	set @tbsh_shortname = N'DEVC';
	set	@id = @DEVC_ID;

	set @rc = 0;
	set @rc_text = N'';
	set @sql_error = 0;
	set @procName = isNull( Object_Name( @@PROCID ), N'<<unbekannt>>' )

	set @step = 'Gültigkeit und Berechtigungen prüfen';
	if ( @DEBUG = 1 )	print @step;

	if ( @rc = 0 )
	begin
		select @b = services.pfn_isValidSession( @SESSION_ID, @USER );
		if ( @b = 0 )	set @rc = -1;
		if ( @rc <> 0 )
		begin
			set @rc_text = N'Der Benutzername oder die Sitzungsinformationen sind ungültig.';	
		end
	end

	if ( @rc = 0 )
	begin
		select @b = services.pfn_checkGrants( @SESSION_ID, @USER, @AAKT_CODE );
		if ( @b = 0 )	set @rc = -1;
		if ( @rc <> 0 )
		begin
			set @rc_text = N'Sie verfügen nicht über ausreichende Berechtigungen, um diese Aktion auszuführen.';
		end
	end


	if ( @rc = 0 )
	begin
		set @step = N'Standard-Validierung durchführen.';
		if ( @DEBUG = 1 )	print @step;
	end

	if ( @rc = 0 ) and ( @AAKT_CODE not in ( 10, 20, 30, 90 ))
	begin
		set @rc = -1;
		set @rc_text = N'Der Aktionscode = ' + convert( nvarchar(10), @AAKT_CODE ) + ' ist ungültig';
	end

	if ( @rc = 0 ) and ( @AAKT_CODE = 10 and @id > 0 )
	begin
		set @rc = -1;
		set @rc_text = N'Die VorgangsID ist > 0, aber als Aktion wurde ''Einfügen'' angegeben.';
	end

	if ( @rc = 0 ) and ( @AAKT_CODE in ( 20, 30, 90 ) and @id = 0 )
	begin
		set @rc = -1;
		set @rc_text = N'Die VorgangsID ist = 0, aber als Aktion wurde ''Ändern'' oder ''Löschen'' angegeben.'; 
	end


	if ( @rc = 0 )	
	begin
		set @step = N'Prüfen, ob der Vorgang noch unverändert vorhanden ist.';
		if ( @DEBUG = 1 )	print @step;

		if ( @AAKT_CODE in ( 20, 30, 90 )) and 
		   ( not exists( select 1 from notifadm.IO_DEVICE where DEVC_ID = @DEVC_ID and DEVC_USER = @DEVC_USER and DEVC_#PTS = @DEVC_XPTS ))
		begin
			set @rc = -1;
			set @rc_text = N'Der Vorgang wurde zwischenzetlich geändert. Die gewünschte Aktion kann nicht durchgeführt werden.';
		end
	end

	if ( @rc = 0 )
	begin
		set @step = N'Fachliche Validierungen durchführen.'; 
		if ( @DEBUG = 1 )	print @step;

		if ( ltrim( rtrim( @DEVC_ADDRESS )) = N'' )	set @DEVC_ADDRESS = null;

		if ( @SBER_ID is null )	set @SBER_ID = 0;
		if ( @CMMD_CODE is null )	set @CMMD_CODE = 0;


	end

	if ( @rc = 0 )
	begin
		set @step = N'Prüfungen sind abgeschlossen und die Verarbeitung wird gestartet.';
		if ( @DEBUG = 1 )	print @step;

		set	@pts = getdate();

		if ( @KZ_USE_TRANSACTION = 1 )
		begin
			begin transaction;
		end

		begin try
			if ( @AAKT_CODE = 10 )
			begin
				set @uqid = NewID();



				if ( @rc = 0 )
				begin
					set @step = N'Einfügen des Vorgangs.';	
					if ( @DEBUG = 1 )	print @step;

					insert into notifadm.IO_DEVICE(
						--DEVC_ID,	-- only of psp_getIdentity() is used
						SBER_ID, CMMD_CODE, DEVC_ADDRESS,
						DEVC_USER, DEVC_PTS, DEVC_#PTS,
						--DEVC_ID_INT,	-- only of psp_getIdentity() is used
						DEVC_UQID )
					values(
						--@id,
						@SBER_ID, @CMMD_CODE, @DEVC_ADDRESS,
						@USER, @pts, services.pfn_getXPTS( @pts ),
						--DEVC_ID_INT,	-- only of psp_getIdentity() is used
						@uqid );

					set @step = N'Lesen des Identitätswertes';
					if ( @DEBUG = 1 )	print @step;

					select	@DEVC_ID = DEVC_ID
					from	notifadm.IO_DEVICE
					where	DEVC_UQID = @uqid;

					if ( @@rowcount <> 1 ) or ( isnull( @DEVC_ID, 0 ) = 0 )
					begin
						set @rc = -1;
						set @rc_text = N'Der neue Vorgang wurde nicht gefunden.';
					end
				end
			end
			else if ( @AAKT_CODE = 20 )
			begin
				set @step = N'Aktualisierung des Vorgangs.';
				if ( @DEBUG = 1 )	print @step;

				update notifadm.IO_DEVICE set

					SBER_ID				= @SBER_ID,
					CMMD_CODE			= @CMMD_CODE,
					DEVC_ADDRESS		= @DEVC_ADDRESS,

					DEVC_USER			= @USER,
					DEVC_PTS			= @pts,
					DEVC_#PTS			= services.pfn_getXPTS( @pts )

				where DEVC_ID = @DEVC_ID and DEVC_USER = @DEVC_USER and DEVC_#PTS = @DEVC_XPTS;

			end
			else if ( @AAKT_CODE = 30 )
			begin
				set @step = N'Löschen des Vorgangs (logisch).';	
				if ( @DEBUG = 1 )	print @step;

				update notifadm.IO_DEVICE set
					DEVC_KZ_GELOESCHT = 1,

					DEVC_USER = @USER,
					DEVC_PTS = @pts,
					DEVC_#PTS = services.pfn_getXPTS( @pts )

				where DEVC_ID = @DEVC_ID and DEVC_USER = @DEVC_USER and DEVC_#PTS = @DEVC_XPTS;

			end
			else if ( @AAKT_CODE = 90 )
			begin
				set @step = N'Löschen des Vorgangs';
				if ( @DEBUG = 1 )	print @step;

				delete from notifadm.IO_DEVICE where DEVC_ID = @DEVC_ID and DEVC_USER = @DEVC_USER and DEVC_#PTS = @DEVC_XPTS;

			end

			if ( @KZ_USE_TRANSACTION = 1 )
			begin
				if ( @rc = 0 )
				begin
					commit transaction;
				end
				else
				begin
					rollback transaction;
				end
			end

		end try
		begin catch

			if ( @KZ_USE_TRANSACTION = 1 )
			begin
				rollback transaction;
			end

			set @sql_error = ERROR_NUMBER();
			set @rc_text = ERROR_MESSAGE();

		end catch;
	end

	if ( @rc <> 0 )
	begin
		if ( isNull( @rc_text, N'' ) = N'' )
			set @rc_text = N'Es ist ein Fehler aufgetreten.';

		set @rc_text = N'(' + @step + '): ' + @rc_text;

		select	@rc_text = services.pfn_getErrorMessageEx( 
					@sql_error,	-- @ERRORNUMBER
					null,		-- @ERRORSEVERITY
					null,		-- @ERRORSTATE
					null,		-- @ERRORLINE
					@procName,	-- @ERRORPROCEDURE
					null,		-- @ERRORMESSAGE
					@rc_text	-- @MSG
				);

		raiserror( @rc_text, 16, 1 );
	end

end;
GO
