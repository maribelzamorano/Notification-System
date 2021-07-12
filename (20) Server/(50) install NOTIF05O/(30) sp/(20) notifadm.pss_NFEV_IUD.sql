/*	
 * topdev GmbH, erstellt am 15.01.2010 10:00		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (020) notifadm.pss_NFEV_IUD.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('notifadm.pss_NFEV_IUD') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure notifadm.pss_NFEV_IUD
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure notifadm.pss_NFEV_IUD
	@SESSION_ID	UDT_SESSION_ID,		
	@USER		UDT_USER,			

	@NFEV_ID	UDT_ID output,		
	@NFEV_USER	nvarchar(128),		
	@NFEV_XPTS	nvarchar(23),		

	@AAKT_CODE	smallint,			

--> 
	@EVTP_CODE				UDT_ID = NULL,
	@NFEV_EVENTID			UDT_ID = NULL,
	@USER_ID				UDT_ID = NULL,
	@NFEV_EMAILCC			NVARCHAR(255) = NULL,
	@NFEV_EMAILBCC			NVARCHAR(255) = NULL,
	@NFEV_ATTACHMENT		XML	      = NULL,
	@NFEV_INFORMATION		XML		  = NULL,
	@NFEV_DIRECTINFORMATION	XML		  = NULL,
	@NFEV_ISREAD			UDT_BOOLEAN = 0,



-->

	@KZ_USE_TRANSACTION	bit = 0,	
	@DEBUG				bit = 0		

as begin

--> Default code block: DO NOT CHANGE!
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
--< 

	set @tbsh_shortname = N'NFEV';
	set	@id = @NFEV_ID;

--> 
	set @rc = 0;
	set @rc_text = N'';
	set @sql_error = 0;
	set @procName = isNull( Object_Name( @@PROCID ), N'<<unbekannt>>' )

----> 
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
----<

----> 
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

----<
--< 

--> 
	if ( @rc = 0 )	
	begin
		set @step = N'Prüfen, ob der Vorgang noch unverändert vorhanden ist.';	
		if ( @DEBUG = 1 )	print @step;

		if ( @AAKT_CODE in ( 20, 30, 90 )) and 
		   ( not exists( select 1 from notifadm.IO_NOTIFICATION_EVENT where NFEV_ID = @NFEV_ID and NFEV_USER = @NFEV_USER and NFEV_#PTS = @NFEV_XPTS ))
		begin
			set @rc = -1;
			set @rc_text = N'Der Vorgang wurde zwischenzetlich geändert. Die gewünschte Aktion kann nicht durchgeführt werden.'; 
		end
	end

	if ( @rc = 0 )
	begin
		set @step = N'Fachliche Validierungen durchführen.'; 
		if ( @DEBUG = 1 )	print @step;

		if ( @NFEV_ISREAD is null )	set @NFEV_ISREAD = 0;
	end
--<

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

--				set @id = 0;
--				exec services.psp_GetIdentity @TBSH_SHORTNAME = @tbsh_shortname, @IDEN_VALUE = @id output
--				if ( isNull( @id, 0 ) = 0 )
--				begin
--					set @rc = -1;
--					set @rc_text = N'Der Identitätswert für ' + @tbsh_shortname + N' konnte nicht ermittelt werden.';
--				end

				if ( @rc = 0 )
				begin
					set @step = N'Einfügen des Vorgangs.';	
					if ( @DEBUG = 1 )	print @step;

					insert into notifadm.IO_NOTIFICATION_EVENT(
						--NFEV_ID,	-- only of psp_getIdentity() is used
						EVTP_CODE,NFEV_EVENTID,[USER_ID], NFEV_EMAILCC,
						NFEV_EMAILBCC,NFEV_ATTACHMENT, NFEV_INFORMATION,
						NFEV_DIRECTINFORMATION,NFEV_ISREAD,
						NFEV_USER, NFEV_PTS, NFEV_#PTS,
						--NFEV_ID_INT,	-- only of psp_getIdentity() is used
						NFEV_UQID )
					values(
						--@id,
						@EVTP_CODE,@NFEV_EVENTID,@USER_ID, @NFEV_EMAILCC,
						@NFEV_EMAILBCC,@NFEV_ATTACHMENT, @NFEV_INFORMATION,
						@NFEV_DIRECTINFORMATION,@NFEV_ISREAD,
						@USER, @pts, services.pfn_getXPTS( @pts ),
						--NFEV_ID_INT,	-- only of psp_getIdentity() is used
						@uqid );

					set @step = N'Lesen des Identitätswertes';	
					if ( @DEBUG = 1 )	print @step;

					select	@NFEV_ID = NFEV_ID
					from	notifadm.IO_NOTIFICATION_EVENT
					where	NFEV_UQID = @uqid;

					if ( @@rowcount <> 1 ) or ( isnull( @NFEV_ID, 0 ) = 0 )
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

				update notifadm.IO_NOTIFICATION_EVENT set

					EVTP_CODE			   =@EVTP_CODE,
					NFEV_EVENTID		   =@NFEV_EVENTID,
					[USER_ID]			   =@USER_ID,
					NFEV_EMAILCC		   =@NFEV_EMAILCC,
					NFEV_EMAILBCC	       =@NFEV_EMAILBCC,
					NFEV_ATTACHMENT		   =@NFEV_ATTACHMENT,
					NFEV_INFORMATION	   =@NFEV_INFORMATION,
					NFEV_DIRECTINFORMATION =@NFEV_DIRECTINFORMATION,
					NFEV_ISREAD			   =@NFEV_ISREAD, 

					NFEV_USER			   =@USER,
					NFEV_PTS			   =@pts,
					NFEV_#PTS			   =services.pfn_getXPTS( @pts )

				where NFEV_ID = @NFEV_ID and NFEV_USER = @NFEV_USER and NFEV_#PTS = @NFEV_XPTS;

			end
			else if ( @AAKT_CODE = 30 )
			begin
				set @step = N'Löschen des Vorgangs (logisch).';	
				if ( @DEBUG = 1 )	print @step;

				update notifadm.IO_NOTIFICATION_EVENT set
					NFEV_KZ_GELOESCHT = 1,

					NFEV_USER = @USER,
					NFEV_PTS = @pts,
					NFEV_#PTS = services.pfn_getXPTS( @pts )

				where NFEV_ID = @NFEV_ID and NFEV_USER = @NFEV_USER and NFEV_#PTS = @NFEV_XPTS;

			end
			else if ( @AAKT_CODE = 90 )
			begin
				set @step = N'Löschen des Vorgangs';	
				if ( @DEBUG = 1 )	print @step;

				delete from notifadm.IO_NOTIFICATION_EVENT where NFEV_ID = @NFEV_ID and NFEV_USER = @NFEV_USER and NFEV_#PTS = @NFEV_XPTS;

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
