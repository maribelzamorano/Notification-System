<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">

Betreff: Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten

Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten gemäß §34 Absatz 2 Satz 2 Thüringer Lehrerbildungsgesetz (ThürLbG) vom 12. März 2008 i.V.m. §§4ff. der Verordnung zur Akkreditierung
<xsl:value-of select="@ABIE_NUMMER" />

Sehr geehrter Anbieter,

das Akkreditierungsverfahren zu Ihrem Antrag vom <xsl:value-of select="@ANTRAG_DATUM" /> auf Akkreditierung als Anbieter von Fortbildungsangeboten für Thüringer Lehrkräfte ist seit mehr als 4 Wochen (<xsl:value-of select="@ANSCHREIBEN_DATUM" />) ausgesetzt.

Sie wurden gebeten, weitere entscheidungsnotwendige Unterlagen zu Ihrem Antrag nachzuweisen.

Bitte reichen Sie die fehlenden Unterlagen bis zum <xsl:value-of select="@FRIST_DATUM" /> nach. Andernfalls muss Ihr Antrag auf Akkreditierung als Anbieter von Fortbildungsangeboten abgelehnt werden.

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


		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>
