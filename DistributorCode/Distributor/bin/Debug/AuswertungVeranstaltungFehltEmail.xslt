<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Fehlende Auswertung Ihrer Veranstaltung

Sehr geehrter Anbieter,

für die von Ihnen durchgeführte
Veranstaltung:  <xsl:value-of select="@VESG_NR" />
am:  <xsl:value-of select="@VESG_BEGINN" />
Angebot:  <xsl:value-of select="@ANBO_NUMMER" />
Thema:  <xsl:value-of select="@ANBO_THEMA" />

wurden noch keine Auswertungsdaten eingegeben. 

Bitte beachten Sie, dass Sie zur Auswertung von Veranstaltungen innerhalb einer Frist von 4 Wochen nach Veranstaltungsende verpflichtet sind.

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
