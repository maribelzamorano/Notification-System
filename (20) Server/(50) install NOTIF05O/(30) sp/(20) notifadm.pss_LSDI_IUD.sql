/*	
 * topdev GmbH, erstellt am 10.02.2010 09:19		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (020) notifadm.pss_LSDI_IUD.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('notifadm.pss_LSDI_IUD') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure notifadm.pss_LSDI_IUD
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure notifadm.pss_LSDI_IUD
	@SESSION_ID	UDT_SESSION_ID,		
	@USER		UDT_USER,		

	@LSDI_ID	UDT_ID output,		
	@LSDI_USER	nvarchar(128),		
	@LSDI_XPTS	nvarchar(23),		

	@AAKT_CODE	smallint,			

--> business fields
	@LSDI_STARTTIME			datetime = NULL,
	@LSDI_ENDTIME			datetime = NULL,
	@LSDI_RC				integer = NULL,
	@LSDI_RC_TEXT			nvarchar(255)= NULL,

-->

	@KZ_USE_TRANSACTION	bit = 0,	
	@DEBUG				bit = 0		

as begin

--> 
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

	set @tbsh_shortname = N'LSDI';
	set	@id = @LSDI_ID;

--> 
	set @rc = 0;
	set @rc_text = N'';
	set @sql_error = 0;
	set @procName = isNull( Object_Name( @@PROCID ), N'<<unbekannt>>' )

----> 
	set @step = 'G�ltigkeit und Berechtigungen pr�fen';
	if ( @DEBUG = 1 )	print @step;

	if ( @rc = 0 )
	begin
		select @b = services.pfn_isValidSession( @SESSION_ID, @USER );
		if ( @b = 0 )	set @rc = -1;
		if ( @rc <> 0 )
		begin
			set @rc_text = N'Der Benutzername oder die Sitzungsinformationen sind ung�ltig.';
		end
	end

	if ( @rc = 0 )
	begin
		select @b = services.pfn_checkGrants( @SESSION_ID, @USER, @AAKT_CODE );
		if ( @b = 0 )	set @rc = -1;
		if ( @rc <> 0 )
		begin
			set @rc_text = N'Sie verf�gen nicht �ber ausreichende Berechtigungen, um diese Aktion auszuf�hren.';
		end
	end
----<

----> 
	if ( @rc = 0 )
	begin
		set @step = N'Standard-Validierung durchf�hren.';
		if ( @DEBUG = 1 )	print @step;
	end

	if ( @rc = 0 ) and ( @AAKT_CODE not in ( 10, 20, 30, 90 ))
	begin
		set @rc = -1;
		set @rc_text = N'Der Aktionscode = ' + convert( nvarchar(10), @AAKT_CODE ) + ' ist ung�ltig';	
	end

	if ( @rc = 0 ) and ( @AAKT_CODE = 10 and @id > 0 )
	begin
		set @rc = -1;
		set @rc_text = N'Die VorgangsID ist > 0, aber als Aktion wurde ''Einf�gen'' angegeben.';
	end

	if ( @rc = 0 ) and ( @AAKT_CODE in ( 20, 30, 90 ) and @id = 0 )
	begin
		set @rc = -1;
		set @rc_text = N'Die VorgangsID ist = 0, aber als Aktion wurde ''�ndern'' oder ''L�schen'' angegeben.';
	end

----<

--> 
	if ( @rc = 0 )	
	begin
		set @step = N'Pr�fen, ob der Vorgang noch unver�ndert vorhanden ist.';
		if ( @DEBUG = 1 )	print @step;

		if ( @AAKT_CODE in ( 20, 30, 90 )) and 
		   ( not exists( select 1 from notifadm.IO_LOGSERVICEDISTRIBUTOR where LSDI_ID = @LSDI_ID and LSDI_USER = @LSDI_USER and LSDI_#PTS = @LSDI_XPTS ))
		begin
			set @rc = -1;
			set @rc_text = N'Der Vorgang wurde zwischenzetlich ge�ndert. Die gew�nschte Aktion kann nicht durchgef�hrt werden.';
		end
	end

	if ( @rc = 0 )
	begin
		set @step = N'Fachliche Validierungen durchf�hren.'; 
		if ( @DEBUG = 1 )	print @step;


		if ( ltrim( rtrim( @LSDI_RC_TEXT )) = N'' )	set @LSDI_RC_TEXT = null;

		if ( @LSDI_RC is null )	set @LSDI_RC = 0;


	end

--<

	if ( @rc = 0 )
	begin
		set @step = N'Pr�fungen sind abgeschlossen und die Verarbeitung wird gestartet.'; 
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
--					set @rc_text = N'Der Identit�tswert f�r ' + @tbsh_shortname + N' konnte nicht ermittelt werden.';
--				end

				if ( @rc = 0 )
				begin
					set @step = N'Einf�gen des Vorgangs.';
					if ( @DEBUG = 1 )	print @step;

					insert into notifadm.IO_LOGSERVICEDISTRIBUTOR (
						--LSDI_ID,	-- only of psp_getIdentity() is used
						LSDI_STARTTIME,LSDI_ENDTIME,LSDI_RC,LSDI_RC_TEXT,
						LSDI_USER, LSDI_PTS, LSDI_#PTS,
						--LSDI_ID_INT,	-- only of psp_getIdentity() is used
						LSDI_UQID )
					values(
						--@id,
						@LSDI_STARTTIME,@LSDI_ENDTIME,@LSDI_RC,@LSDI_RC_TEXT,
						@USER, @pts, services.pfn_getXPTS( @pts ),
						--LSDI_ID_INT,	-- only of psp_getIdentity() is used
						@uqid );

					set @step = N'Lesen des Identit�tswertes';
					if ( @DEBUG = 1 )	print @step;

					select	@LSDI_ID = LSDI_ID
					from	notifadm.IO_LOGSERVICEDISTRIBUTOR 
					where	LSDI_UQID = @uqid;

					if ( @@rowcount <> 1 ) or ( isnull( @LSDI_ID, 0 ) = 0 )
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

				update notifadm.IO_LOGSERVICEDISTRIBUTOR  set

					LSDI_STARTTIME		=@LSDI_STARTTIME,
					LSDI_ENDTIME		=@LSDI_ENDTIME,
					LSDI_RC				=@LSDI_RC,
					LSDI_RC_TEXT		=@LSDI_RC_TEXT,

					LSDI_USER			= @USER,
					LSDI_PTS			= @pts,
					LSDI_#PTS			= services.pfn_getXPTS( @pts )

				where LSDI_ID = @LSDI_ID and LSDI_USER = @LSDI_USER and LSDI_#PTS = @LSDI_XPTS;

			end
			else if ( @AAKT_CODE = 30 )
			begin
				set @step = N'L�schen des Vorgangs (logisch).';
				if ( @DEBUG = 1 )	print @step;

				update notifadm.IO_LOGSERVICEDISTRIBUTOR  set
					LSDI_KZ_GELOESCHT = 1,

					LSDI_USER = @USER,
					LSDI_PTS = @pts,
					LSDI_#PTS = services.pfn_getXPTS( @pts )

				where LSDI_ID = @LSDI_ID and LSDI_USER = @LSDI_USER and LSDI_#PTS = @LSDI_XPTS;

			end
			else if ( @AAKT_CODE = 90 )
			begin
				set @step = N'L�schen des Vorgangs';
				if ( @DEBUG = 1 )	print @step;

				delete from notifadm.IO_LOGSERVICEDISTRIBUTOR  where LSDI_ID = @LSDI_ID and LSDI_USER = @LSDI_USER and LSDI_#PTS = @LSDI_XPTS;

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
