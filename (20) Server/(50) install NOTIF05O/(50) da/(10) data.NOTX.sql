/*	
 * topdev GmbH, erstellt am 23.02.2010 16:00
 *
 * $Author: Renato Fontes $
 * $Date: 2010-02-23 16:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) data.NOTX.sql $
 *
 */

declare	
		@sbtp_code 			UDT_CODE,
		@cmmd_code	 		UDT_CODE,
		@notx_text			nvarchar(max),
		@pts				UDT_PTS

select	@pts = getdate();

-- Subscription types for accreditation project

select	@sbtp_code  = 1, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">

			Betreff: Anbieterprofil ge�ndert
			Werte Mitarbeiter der Akkreditierungsstelle,
			die Daten des akkreditierten Anbieters
			<xsl:value-of select="@ABIE_NUMMER" />
			wurden vom Anbieter
			am <xsl:value-of select="@ABIE__x005F_x0023_PTS" />
			ge�ndert und sind zu pr�fen.
	
		</xsl:for-each>

	</xsl:template>
	
</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 2 , @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Bescheid der Akkreditierungsstelle Th�ringen

Ihre Anbieternummer: <xsl:value-of select="@ABIE_NUMMER" />

Sehr geehrter Anbieter,

zu Ihrer Akkreditierung als Anbieter bzw. zur Akkreditierung Ihrer Fortbildungsangebote ergeht der in der Anlage beigef�gte Bescheid.

Beachten Sie bitte, dass nur Negativ-Bescheide (Aussetzung bzw. Entzug einer Akkreditierung) auch auf postalischem Wege zugestellt werden.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.

		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 3, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">

Betreff: Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten

Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten gem�� �34 Absatz 2 Satz 2 Th�ringer Lehrerbildungsgesetz (Th�rLbG) vom 12. M�rz 2008 i.V.m. ��4ff. der Verordnung zur Akkreditierung
<xsl:value-of select="@ABIE_NUMMER" />

Sehr geehrter Anbieter,

das Akkreditierungsverfahren zu Ihrem Antrag vom <xsl:value-of select="@ANTRAG_DATUM" /> auf Akkreditierung als Anbieter von Fortbildungsangeboten f�r Th�ringer Lehrkr�fte ist seit mehr als 4 Wochen (<xsl:value-of select="@ANSCHREIBEN_DATUM" />) ausgesetzt.

Sie wurden gebeten, weitere entscheidungsnotwendige Unterlagen zu Ihrem Antrag nachzuweisen.

Bitte reichen Sie die fehlenden Unterlagen bis zum <xsl:value-of select="@FRIST_DATUM" /> nach. Andernfalls muss Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten abgelehnt werden.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.


		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 4, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">


			Betreff: Antrag auf Reakkreditierung als Anbieter

			Sehr geehrter Anbieter,

			f�r Sie als Anbieter von Fortbildungsangeboten steht die Reakkreditierung an. Diese muss innerhalb von 4 Wochen nach Erhalt dieses Schreibens beantragt werden, anderfalls l�uft Ihre Akkreditierung automatisch aus.

			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.


		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>
'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 5, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
			Betreff: 2. Erinnerung - Beantragung der Reakkreditierung als Anbieter

			Sehr geehrter Anbieter,

			m�glicherweise ist unser Schreiben mit der Erinnerung an Ihre Reakkreditierung Ihrer Aufmerksamkeit entgangen.

			Wir haben Sie darauf hingewiesen, dass Ihre Akkreditierung als Anbieter von Fortbildungsangeboten am <xsl:value-of select="@ENDE_DATUM" /> endet. Bisher haben Sie Ihre Reakkreditierung nicht beantragt. Sie k�nnen dann keine Angebote und Veranstaltungen mehr eingeben bzw. bearbeiten. Ihre Veranstaltungen und Sie als Anbieter werden nicht mehr in den entsprechenden Katalogen gelistet.

			Beantragen Sie die Reakkreditierung bitte innerhalb 1 Woche, andernfalls wird Ihre Akkreditierung auslaufen.

			Wenn Sie die Reakkreditierung nicht beantragen m�chten, so betrachten Sie dieses Schreiben bitte als gegenstandslos.

			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.



		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 6, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
			
			Betreff: Erinnerung - Antrag auf Akkreditierung Ihres Angebots fehlt

			Sehr geehrter Anbieter,

			f�r Ihr Angebot mit der Angebotsnummer
			<xsl:value-of select="@ANBO_NUMMER" /> 
			zum Thema:
			<xsl:value-of select="@ANBO_THEMA" /> 

			wurde die Akkreditierung noch nicht beantragt.

			F�r eine Akkreditierung des Angebots muss eine Veranstaltung geplant sein.
			Angebote ohne geplante Veranstaltung, f�r die innerhalb einer Frist von 8 Wochen seit Erstanlage keine Akkreditierung beantragt wurde, werden gel�scht.
			Veranstaltungen, deren Angebot nicht akkreditiert wurde, erscheinen nicht im Katalog.
			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.



		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 7, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
	

			Betreff: Erinnerung - Antrag auf Akkreditierung Ihres Angebots fehlt

			Sehr geehrter Anbieter,

			f�r das von Ihnen geplante Angebot
			<xsl:value-of select="@ANBO_NUMMER" />
			Thema: <xsl:value-of select="@ANBO_THEMA" />

			wurde die Akkreditierung noch nicht beantragt.
			Falls die Akkreditierung in den folgenden 2 Wochen nicht beantragt wird, so wird Ihr Angebot mit Ablauf dieser Frist gel�scht.

			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.




		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 8, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
	
			Betreff: Ihr Antrag auf Akkreditierung eines Fortbildungsangebots

			Ihr Antrag auf Akkreditierung eines Fortbildungsangebots gem�� �34 Absatz 2 Satz 2 Th�ringer Lehrerbildungsgesetz (Th�rLbG) vom 12. M�rz 2008 i.V.m. der Verordnung zur Akkreditierung
			<xsl:value-of select="@ABIE_NUMMER" />
			<xsl:value-of select="@ANBO_NUMMER" />

			Sehr geehrter Anbieter,

			das Akkreditierungsverfahren zu Ihrem Antrag vom <xsl:value-of select="@ANTRAG_DATUM" /> auf Akkreditierung eines Fortbildungsangebots f�r Th�ringer Lehrkr�fte ist seit mehr als 4 Wochen (<xsl:value-of select="@ANSCHREIBEN_DATUM" />
				) ausgesetzt.
				Sie wurden gebeten, weitere entscheidungsnotwendige Unterlagen zu Ihrem Antrag nachzuweisen.
				Bitte reichen Sie die fehlenden Unterlagen bis zum <xsl:value-of select="@FRIST_DATUM" /> nach. Andernfalls muss Ihr Antrag auf Akkreditierung eines Fortbildungsangebots abgelehnt werden.

			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.




		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 9, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
	

			Betreff: Neue Meldung aus Schnittstellenlauf

			Bei der Ausf�hrung der Schnittstelle <xsl:value-of select="@ILOG_IMPORTQUELLE" />wurde folgende Meldung erzeugt:

			Lfd.-Nr.: <xsl:value-of select="@MLOG_ID" />
			Art: <xsl:value-of select="@LTYP_CODE" />
			Text: <xsl:value-of select="@MLOG_TEXT" />

			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.





		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 10, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
	

			Betreff: Neues Kennwort

			Sehr geehrter Nutzer,

			Sie haben ein neues Kennwort beantragt, ihr neu generiertes Kennwort lautet:

			<xsl:value-of select="@KENNWORT" />
			

			Mit freundlichen Gr��en

			**************************************************
			Diese E-Mail wurde maschinell erstellt und automatisch versendet.
			*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

			Th�ringer Institut f�r Lehrerfortbildung,
			Lehrplanentwicklung und Medien (ThILLM)
			Akkreditierungsstelle
			Heinrich-Heine-Allee 2-4
			99438 Bad Berka

			E-Mail: akkreditierung@thillm.thueringen.de
			Tel: 036458/56-0
			Fax: 036458/56-300
			URL: www.thillm.de

			Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.






		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 11, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Ihre Benutzerkennung

Sehr geehrter Nutzer,

Sie haben Ihre Benutzerkennung per E-Mail angefordert.  Ihre Benutzerkennung lautet:

<xsl:value-of select="@GEPA_LOGINID" />

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.


			
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 12, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Ein Teilnehmer hat sich zu einer Veranstaltung angemeldet


Sehr geehrter Anbieter,

f�r Sie ist eine neue Anmeldung eingetroffen:

Veranstaltungs-Nr.(Anbieter): <xsl:value-of select="@TEIL_VESG_NR" />
Veranstaltungs-Nr.(Akkreditierungsstelle): <xsl:value-of select="@TEIL_VESG_NR2" />
Thema: <xsl:value-of select="@ANBO_THEMA" />
Interessent/-in: <xsl:value-of select="@TEIL_VORNAME" />
<xsl:value-of select="@TEIL_NACHNAME" />
Dienststelle: <xsl:value-of select="@TEIL_DIEN_NAME" />
Personalnummer: <xsl:value-of select="@TEIL_PERSONALNUMMER" />
Dienstanschrift: <xsl:value-of select="@TEIL_DIEN_STRASSE" />
<xsl:value-of select="@TEIL_DIEN_HAUSNUMMER" />
<xsl:value-of select="@TEIL_DIEN_HAUSNUMMERZUSATZ" />
, <xsl:value-of select="@TEIL_DIEN_POSTLEITZAHL" />
<xsl:value-of select="@TEIL_DIEN_ORT" />
Privatanschrift: <xsl:value-of select="@TEIL_STRASSE" />
<xsl:value-of select="@TEIL_HAUSNUMMER" />
<xsl:value-of select="@TEIL_HAUSNUMMERZUSATZ" />
, <xsl:value-of select="@TEIL_POSTLEITZAHL" />
<xsl:value-of select="@TEIL_ORT" />
E-Mail: <xsl:value-of select="@TEIL_EMAIL" />
Bemerkung des Teilnehmers: <xsl:value-of select="@TEIL_BEMERKUNG" />

Bitte antworten Sie ausschlie�lich dem Interessenten an Ihrer Veranstaltung.

F�r die Anmeldung haftet allein der Interessent, nicht das ThILLM.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.

			
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 13, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Ein Teilnehmer hat seine Teilnahme abgesagt


Sehr geehrter Anbieter,

f�r Sie ist die Absage eines Teilnehmers eingetroffen:

Veranstaltungs-Nr.(Anbieter): <xsl:value-of select="@TEIL_VESG_NR" />
Veranstaltungs-Nr.(Akkreditierungsstelle): <xsl:value-of select="@TEIL_VESG_NR2" />
Thema: <xsl:value-of select="@ANBO_THEMA" />
Interessent/-in: <xsl:value-of select="@TEIL_VORNAME" />
<xsl:value-of select="@TEIL_NACHNAME" />
Dienststelle: <xsl:value-of select="@TEIL_DIEN_NAME" />
Personalnummer: <xsl:value-of select="@TEIL_PERSONALNUMMER" />
Dienstanschrift: <xsl:value-of select="@TEIL_DIEN_STRASSE" />
<xsl:value-of select="@TEIL_DIEN_HAUSNUMMER" />
<xsl:value-of select="@TEIL_DIEN_HAUSNUMMERZUSATZ" />
, <xsl:value-of select="@TEIL_DIEN_POSTLEITZAHL" />
<xsl:value-of select="@TEIL_DIEN_ORT" />
Privatanschrift: <xsl:value-of select="@TEIL_STRASSE" />
<xsl:value-of select="@TEIL_HAUSNUMMER" />
<xsl:value-of select="@TEIL_HAUSNUMMERZUSATZ" />
, <xsl:value-of select="@TEIL_POSTLEITZAHL" />
<xsl:value-of select="@TEIL_ORT" />
E-Mail: <xsl:value-of select="@TEIL_EMAIL" />
Grund f�r die Nichtteilnahme: <xsl:value-of select="@TEIL_NICHTTEILNAHME_GRUND" />

Bitte antworten Sie ausschlie�lich dem Interessenten an Ihrer Veranstaltung.

F�r die Anmeldung haftet allein der Interessent, nicht das ThILLM.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.
.
			
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 14, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Ablauf Ihrer Abrufveranstaltung

Sehr geehrter Anbieter,

die G�ltigkeit Ihrer Abrufveranstaltung <xsl:value-of select="@VESG_NR2" />
Thema: <xsl:value-of select="@ANBO_THEMA" />
Angebotsnummer: <xsl:value-of select="@ANBO_NUMMER" />

ist am <xsl:value-of select="@VESG_AUF_ABRUF_BIS" />
abgelaufen.

Sie haben die M�glichkeit, die G�ltigkeitsdauer dieser Abrufveranstaltung um weitere 12 Monate zu verl�ngern. Nutzen Sie daf�r den folgenden Link:

<xsl:value-of select="@LINK" />

Bitte beachten Sie, dass der Link nur f�r die n�chsten 90 Tage aktiv geschaltet ist. Danach ist eine Verl�ngerung der Abrufveranstaltung �ber diesen Link nicht mehr m�glich.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.
			
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 15, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Fehlende Akkreditierung Ihres Angebots

Sehr geehrter Anbieter,

Ihre Veranstaltung

<xsl:value-of select="@VESG_NR" />

soll in weniger als 4 Wochen stattfinden. F�r das zugeh�rige Angebot mit der Angebotsnummer
<xsl:value-of select="@ANBO_NUMMER" />
Thema: <xsl:value-of select="@ANBO_THEMA" />

ist die Akkreditierung noch nicht beantragt.
Bitte beachten Sie, dass die Veranstaltungen zu Ihrem Angebot ohne Akkreditierung nicht im Katalog erscheinen.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.

		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 16, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">

Betreff: Fehlende Akkreditierung eines Angebotes im Status "Akkreditierung beantragt"
Werte Mitarbeiter der Akkreditierungsstelle,
f�r das Angebot
<xsl:value-of select="@ANBO_NUMMER" />
Thema: <xsl:value-of select="@ANBO_THEMA" />
wurde die Akkreditierung beantragt.
Dieser Antrag muss bevorzugt bearbeitet werden, da die Veranstaltung
<xsl:value-of select="@VESG_NR" />
Datum: <xsl:value-of select="@VESG_BEGINN" />
in weniger als 2 Wochen stattfindet.

		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

select	@sbtp_code  = 17, @cmmd_code = 1
if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
begin
	select @notx_text = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Fehlende Auswertung Ihrer Veranstaltung

Sehr geehrter Anbieter,

f�r die von Ihnen durchgef�hrte
Veranstaltung:  <xsl:value-of select="@VESG_NR" />
am:  <xsl:value-of select="@VESG_BEGINN" />
Angebot:  <xsl:value-of select="@ANBO_NUMMER" />
Thema:  <xsl:value-of select="@ANBO_THEMA" />

wurden noch keine Auswertungsdaten eingegeben. 

Bitte beachten Sie, dass Sie zur Auswertung von Veranstaltungen innerhalb einer Frist von 4 Wochen nach Veranstaltungsende verpflichtet sind.

Mit freundlichen Gr��en

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten f�r beide Geschlechter gleicherma�en.

Th�ringer Institut f�r Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur f�r den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschl�sselung geeignet.
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>'

	insert into notifadm.IO_NOTIFICATION_TEXT (
				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
end

--select	@sbtp_code  = , @cmmd_code = 
--if ( not exists( select 1 from notifadm.IO_NOTIFICATION_TEXT where SBTP_CODE = @sbtp_code AND CMMD_CODE = @cmmd_code ))
--begin
--	select @notx_text = ''
--
--	insert into notifadm.IO_NOTIFICATION_TEXT (
--				SBTP_CODE, CMMD_CODE, NOTX_TEXT, NOTX_PTS, NOTX_#PTS)
--	values ( @sbtp_code, @cmmd_code, @notx_text, @pts, convert( nvarchar(23), @pts, 121 ))
--end