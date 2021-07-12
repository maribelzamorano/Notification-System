<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Bescheid der Akkreditierungsstelle Thüringen

Ihre Anbieternummer: <xsl:value-of select="@ABIE_NUMMER" />

Sehr geehrter Anbieter,

zu Ihrer Akkreditierung als Anbieter bzw. zur Akkreditierung Ihrer Fortbildungsangebote ergeht der in der Anlage beigefügte Bescheid.

Beachten Sie bitte, dass nur Negativ-Bescheide (Aussetzung bzw. Entzug einer Akkreditierung) auch auf postalischem Wege zugestellt werden.

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
