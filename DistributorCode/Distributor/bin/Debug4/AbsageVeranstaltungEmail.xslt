<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Ein Teilnehmer hat seine Teilnahme abgesagt


Sehr geehrter Anbieter,

für Sie ist die Absage eines Teilnehmers eingetroffen:

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
Grund für die Nichtteilnahme: <xsl:value-of select="@TEIL_NICHTTEILNAHME_GRUND" />

Bitte antworten Sie ausschließlich dem Interessenten an Ihrer Veranstaltung.

Für die Anmeldung haftet allein der Interessent, nicht das ThILLM.

Mit freundlichen Grüßen

**************************************************
Diese E-Mail wurde maschinell erstellt und automatisch versendet.
*Personenbezeichnungen gelten für beide Geschlechter gleichermaßen.

Thüringer Institut für Lehrerfortbildung,
Lehrplanentwicklung und Medien (ThILLM)
Akkreditierungsstelle
Heinrich-Heine-Allee 2-4
99438 Bad Berka

E-Mail: akkreditierung@thillm.thueringen.de
Tel: 036458/56-0
Fax: 036458/56-300
URL: www.thillm.de

Hinweis: E-Mail-Adressen sind nur für den Empfang einfacher Mitteilungen ohne Signatur und/oder Verschlüsselung geeignet.
.
			
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>
