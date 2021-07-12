/*	
 * topdev GmbH, erstellt am 06.02.2010 11:00
 *
 * $Author: Harald Dahlen $
 * $Date: 2010-02-06 11:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) data.EVTP.sql $
 *
 */

declare	@bt_database	nvarchar(255),
		@bt_schema		nvarchar(255),
		@evtp_btable	nvarchar(max),
		@evtp_idbtable	nvarchar(255),
		@evtp_code 		UDT_CODE,
		@evtp_decode 	UDT_DECODE,
		@pts			UDT_PTS

set	@pts = getdate();

-- Event types for accreditation project

set @bt_database = 'AKK05O'
set @bt_schema = 'AKKRADM'

select	@evtp_code = '1', @evtp_decode = N'abie.update'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_ANBIETER'
	set @evtp_idbtable = 'ABIE_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '2', @evtp_decode = N'akrb.freig'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_AKKREDITIERUNGSBESCHEID join ' +
						@bt_database + '.' + @bt_schema + '.T_ANBIETER on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANBIETER.ABIE_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_AKKREDITIERUNGSBESCHEID.ABIE_ID )' 
	set @evtp_idbtable = 'AKRB_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '3', @evtp_decode = N'abie.ausges'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_ANBIETER'
	set @evtp_idbtable = 'ABIE_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '4', @evtp_decode = N'abie.reakk.l1'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_ANBIETER'
	set @evtp_idbtable = 'ABIE_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '5', @evtp_decode = N'abie.reakk.l2'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_ANBIETER'
	set @evtp_idbtable = 'ABIE_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '6', @evtp_decode = N'anbo.antrfeh.l1'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_ANGEBOT'
	set @evtp_idbtable = 'ANBO_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '7', @evtp_decode = N'anbo.antrfeh.l2'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_ANGEBOT'
	set @evtp_idbtable = 'ANBO_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '8', @evtp_decode = N'anbo.ausges'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_ANGEBOT join ' +
						@bt_database + '.' + @bt_schema + '.T_ANBIETER on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANBIETER.ABIE_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ABIE_ID )' 
	set @evtp_idbtable = 'ANBO_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '9', @evtp_decode = N'mlog.neu'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_MELDUNG join ' +
						@bt_database + '.' + @bt_schema + '.T_IMPORTLOG on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_IMPORTLOG.ILOG_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_MELDUNG.ILOG_ID ) join ' + 
						@bt_database + '.' + @bt_schema + '.T_BENACHRICHTIGUNGSPROFIL on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_BENACHRICHTIGUNGSPROFIL.BEPR_IMPORTQUELLE = ' + 
						@bt_database + '.' + @bt_schema + '.T_IMPORTLOG.BEPR_IMPORTQUELLE )'
	set @evtp_idbtable = 'MLOG_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '10', @evtp_decode = N'gepa.kennw.neu'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.T_GESCHAEFTSPARTNER'
	set @evtp_idbtable = 'GEPA_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '11', @evtp_decode = N'gepa.login.verg'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable = @bt_database + '.' + @bt_schema + '.V_GEPA_LOGINID'
	set @evtp_idbtable = 'GEPA_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '12', @evtp_decode = N'teil.neu'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_TEILNEHMER join ' +
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.VESG_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_TEILNEHMER.VESG_ID ) join ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ANBO_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.ANBO_ID )'
	set @evtp_idbtable = 'TEIL_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '13', @evtp_decode = N'teil.absage'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_TEILNEHMER join ' +
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.VESG_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_TEILNEHMER.VESG_ID ) join ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ANBO_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.ANBO_ID )'
	set @evtp_idbtable = 'TEIL_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '14', @evtp_decode = N'vesg.ablauf.abr'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG join ' +
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ANBO_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.ANBO_ID )' 
	set @evtp_idbtable = 'VESG_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '15', @evtp_decode = N'vesg.antr.fehlt'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG join ' +
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ANBO_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.ANBO_ID )' 
	set @evtp_idbtable = 'VESG_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '16', @evtp_decode = N'vesg.akk.fehlt'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG join ' +
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ANBO_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.ANBO_ID )' 
	set @evtp_idbtable = 'VESG_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@evtp_code = '17', @evtp_decode = N'vesg.ausw.fehlt'
if ( not exists( select 1 from notifadm.IO_EVENT_TYPE where EVTP_CODE = @evtp_code AND EVTP_DECODE = @evtp_decode ))
begin
	set @evtp_btable =	@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG join ' +
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT on ( ' + 
						@bt_database + '.' + @bt_schema + '.T_ANGEBOT.ANBO_ID = ' + 
						@bt_database + '.' + @bt_schema + '.T_VERANSTALTUNG.ANBO_ID )' 
	set @evtp_idbtable = 'VESG_ID'
	insert into notifadm.IO_EVENT_TYPE( 
			EVTP_CODE, EVTP_DECODE, EVTP_BTABLE, EVTP_IDBTABLE, EVTP_PTS, EVTP_#PTS )
	values(	 @evtp_code, @evtp_decode, @evtp_btable, @evtp_idbtable, @pts, convert( nvarchar(23), @pts, 121 ) )
end

GO

