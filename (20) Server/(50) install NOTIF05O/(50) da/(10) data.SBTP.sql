/*	
 * topdev GmbH, erstellt am 07.02.2010 11:00
 *
 * $Author: Harald Dahlen $
 * $Date: 2010-02-07 11:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) data.SBTP.sql $
 *
 */

declare	@sbtp_conditions	nvarchar(max),
		@sbtp_fields		nvarchar(max),
		@sbtp_emailadr		nvarchar(255),
		@sbtp_emailsub		nvarchar(max),
		@sbtp_emailreplyadr		nvarchar(255),
		@sbtp_emailcc		nvarchar(1000),
		@sbtp_emailbcc		nvarchar(1000),
		@sbtp_code 			UDT_CODE,
		@sbtp_decode 		UDT_DECODE,
		@pts				UDT_PTS

select	@pts = getdate();

-- Subscription types for accreditation project

select	@sbtp_emailadr = 'akkreditierung@thillm.de',
		@sbtp_emailreplyadr = null,
		@sbtp_emailcc = null,
		@sbtp_emailbcc = null

select	@sbtp_code = '1', @sbtp_decode = N'AktualisierungAnbieterdaten'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator=">" format="#1#" /></xmldata>'
	select @sbtp_fields = '<xmldata><data name="ABIE_NUMMER" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Anbieterprofil geändert" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '2', @sbtp_decode = N'VersendenAkkreditierungsbescheid'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="T_AKKREDITIERUNGSBESCHEID.ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields = '<xmldata><data name="ABIE_NUMMER" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Bescheid der Akkreditierungsstelle Thüringen" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '3', @sbtp_decode = N'AnbieterstatusZulangeAusgesetzt'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="ABIE_NUMMER" />' + 
								     '<data name="convert(nvarchar(10), ABIE_ANTRAG_AKKREDITIERUNG_DATUM, 104) as ANTRAG_DATUM" />' +
								     '<data name=”convert(nvarchar(10), ABIE_PTS_ABST, 104) as ANSCHREIBEN_DATUM” />' +
								     '<data name=”convert(nvarchar(10), dateadd(week, 2, getdate()), 104) as FRIST_DATUM” />' +
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '4', @sbtp_decode = N'ReakkreditierungStufe1'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields = '<xmldata><data name="ABIE_NUMMER" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Antrag auf Reakkreditierung als Anbieter" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '5', @sbtp_decode = N'ReakkreditierungStufe2'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields = '<xmldata><data name="ABIE_NUMMER" /><data name="convert(nvarchar(10), dateadd(week, 1, getdate()), 104) as ENDE_DATUM" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="2. Erinnerung - Beantragung der Reakkreditierung als Anbieter" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '6', @sbtp_decode = N'AngebotNichtBeantragtStufe1'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields = '<xmldata><data name="ANBO_NUMMER" /><data name="ANBO_THEMA" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Erinnerung - Antrag auf Akkreditierung Ihres Angebots fehlt" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '7', @sbtp_decode = N'AngebotNichtBeantragtStufe2'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields = '<xmldata><data name="ANBO_NUMMER" /><data name="ANBO_THEMA" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="2. Erinnerung - Antrag auf Akkreditierung Ihres Angebots fehlt" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '8', @sbtp_decode = N'AngebotsstatusZulangeAusgesetzt'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="ABIE_NUMMER" />' + 
									 '<data name="ANBO_NUMMER" />' + 
								     '<data name="convert(nvarchar(10), ANBO_ANTRAG_AKKREDITIERUNG_DATUM, 104) as ANTRAG_DATUM" />' +
								     '<data name="convert(nvarchar(10), ANBO_PTS_ABST, 104) as ANSCHREIBEN_DATUM" />' +
								     '<data name="convert(nvarchar(10), dateadd(week, 2, getdate()), 104) as FRIST_DATUM" />' +
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Ihr Antrag auf Akkreditierung eines Fortbildungsangebots" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '9', @sbtp_decode = N'NeueMeldung'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Benachrichtigungsprofil" dbcolumn="BEPR_ID" operator="=" format="#1#" />' +
										'<data name="Meldungstyp" dbcolumn="T_MELDUNG.LTYP_CODE" operator="=" format="''#1#''" />' +
										'<data name="Anbieternummer" dbcolumn="T_MELDUNG.ABIE_NUMMER" operator="=" format="''#1#''" />' +
							  '</xmldata>'
	select @sbtp_fields =	'<xmldata><data name="MLOG_ID" />' + 
									 '<data name="ANBO_NUMMER" />' + 
								     '<data name="T_MELDUNG.LTYP_CODE as LTYP_CODE" />' +
								     '<data name="MLOG_TEXT" />' +
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Neue Meldung aus Schnittstellenlauf" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '10', @sbtp_decode = N'Kennwortversand'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Gepa" dbcolumn="GEPA_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="GEPA_ID" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Neues Kennwort" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '11', @sbtp_decode = N'Loginversand'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Gepa" dbcolumn="GEPA_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="GEPA_LOGINID" /></xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Ihre Benutzerkennung" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '12', @sbtp_decode = N'AnmeldungVeranstaltung'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="T_ANGEBOT.ABIE_ID" operator=">" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="TEIL_VESG_NR" />' + 
									 '<data name="TEIL_VESG_NR2" />' + 
									 '<data name=”TEIL_VORNAME” />' +
									 '<data name=”TEIL_NACHNAME” />' +
									 '<data name=”TEIL_DIEN_NAME” />' +
									 '<data name=”TEIL_PERSONALNUMMER” />' +
									 '<data name=”TEIL_DIEN_STRASSE” />' +
									 '<data name=”TEIL_DIEN_HAUSNUMMER ” />' +
									 '<data name=”TEIL_DIEN_HAUSNUMMERZUSATZ” />' +
									 '<data name=”TEIL_DIEN_POSTLEITZAHL” />' +
									 '<data name=”TEIL_DIEN_ORT” />' +
									 '<data name=”TEIL_STRASSE” />' +
									 '<data name=”TEIL_HAUSNUMMER” />' +
									 '<data name=”TEIL_HAUSNUMMERZUSATZ” />' +
									 '<data name=”TEIL_POSTLEITZAHL” />' +
									 '<data name=”TEIL_ORT ” />' +
									 '<data name=”TEIL_EMAIL” />' +
									 '<data name=”TEIL_BEMERKUNG ” />' +
									 '<data name=”ANBO_THEMA ” />' +
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Ein Teilnehmer hat sich zu einer Veranstaltung angemeldet" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '13', @sbtp_decode = N'AbsageVeranstaltung'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="T_ANGEBOT.ABIE_ID" operator=">" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="TEIL_VESG_NR" />' + 
									 '<data name="TEIL_VESG_NR2" />' + 
									 '<data name=”TEIL_VORNAME” />' +
									 '<data name=”TEIL_NACHNAME” />' +
									 '<data name=”TEIL_DIEN_NAME” />' +
									 '<data name=”TEIL_PERSONALNUMMER” />' +
									 '<data name=”TEIL_DIEN_STRASSE” />' +
									 '<data name=”TEIL_DIEN_HAUSNUMMER ” />' +
									 '<data name=”TEIL_DIEN_HAUSNUMMERZUSATZ” />' +
									 '<data name=”TEIL_DIEN_POSTLEITZAHL” />' +
									 '<data name=”TEIL_DIEN_ORT” />' +
									 '<data name=”TEIL_STRASSE” />' +
									 '<data name=”TEIL_HAUSNUMMER” />' +
									 '<data name=”TEIL_HAUSNUMMERZUSATZ” />' +
									 '<data name=”TEIL_POSTLEITZAHL” />' +
									 '<data name=”TEIL_ORT ” />' +
									 '<data name=”TEIL_EMAIL” />' +
									 '<data name=”TEIL_BEMERKUNG ” />' +
									 '<data name=”ANBO_THEMA ” />' +
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Ein Teilnehmer hat seine Teilnahme abgesagt" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '14', @sbtp_decode = N'AblaufAbrufveranstaltung'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="VESG_NR" />' + 
								     '<data name="convert(nvarchar(10), VESG_AUF_ABRUF_BIS, 104) as VESG_AUF_ABRUF_BIS" />' +
									 '<data name="ANBO_NUMMER" />' + 
									 '<data name="ANBO_THEMA" />' + 
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Ablauf Ihrer Abrufveranstaltung" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '15', @sbtp_decode = N'BeantragungAngebotFehlt'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="VESG_NR" />' + 
									 '<data name="ANBO_NUMMER" />' + 
									 '<data name="ANBO_THEMA" />' + 
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Fehlende Akkreditierung Ihres Angebots" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '16', @sbtp_decode = N'AkkreditierungAngebotFehlt'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator=">" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="VESG_NR" />' + 
								     '<data name="convert(nvarchar(10), VESG_BEGINN, 104) as VESG_BEGINN" />' +
									 '<data name="ANBO_NUMMER" />' + 
									 '<data name="ANBO_THEMA" />' + 
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Fehlende Akkreditierung eines Angebotes im Status "Akkreditierung beantragt"" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end

select	@sbtp_code = '17', @sbtp_decode = N'AuswertungVeranstaltungFehlt'
if ( not exists( select 1 from notifadm.IO_SUBSCRIPTION_TYPE where SBTP_CODE = @sbtp_code AND SBTP_DECODE = @sbtp_decode ))
begin
	select @sbtp_conditions = '<xmldata><data name="Anbieter" dbcolumn="ABIE_ID" operator="=" format="#1#" /></xmldata>'
	select @sbtp_fields =	'<xmldata><data name="VESG_NR" />' + 
								     '<data name="convert(nvarchar(10), VESG_BEGINN, 104) as VESG_BEGINN" />' +
									 '<data name="ANBO_NUMMER" />' + 
									 '<data name="ANBO_THEMA" />' + 
							'</xmldata>'
	select @sbtp_emailsub = '<xmldata><data subject="Fehlende Auswertung Ihrer Veranstaltung" /></xmldata>'
	insert into notifadm.IO_SUBSCRIPTION_TYPE( 
			SBTP_CODE, SBTP_DECODE, SBTP_CONDITIONS, SBTP_FIELDS, SBTP_EMAILADR, SBTP_EMAILSUB, SBTP_EMAILREPLYADR, SBTP_EMAILCC, SBTP_EMAILBCC, SBTP_PTS, SBTP_#PTS )
	values(	 @sbtp_code, @sbtp_decode, @sbtp_conditions, @sbtp_fields, @sbtp_emailadr, @sbtp_emailsub, @sbtp_emailreplyadr, @sbtp_emailcc, @sbtp_emailbcc, @pts, convert( nvarchar(23), @pts, 121 ) )
end


GO

