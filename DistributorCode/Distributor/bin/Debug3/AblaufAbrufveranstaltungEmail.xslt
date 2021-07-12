<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
Betreff: Ablauf Ihrer Abrufveranstaltung

Sehr geehrter Anbieter,

die Gültigkeit Ihrer Abrufveranstaltung <xsl:value-of select="@VESG_NR2" />
Thema: <xsl:value-of select="@ANBO_THEMA" />
Angebotsnummer: <xsl:value-of select="@ANBO_NUMMER" />

ist am <xsl:value-of select="@VESG_AUF_ABRUF_BIS" />
abgelaufen.

Sie haben die Möglichkeit, die Gültigkeitsdauer dieser Abrufveranstaltung um weitere 12 Monate zu verlängern. Nutzen Sie dafür den folgenden Link:

<xsl:value-of select="@LINK" />

Bitte beachten Sie, dass der Link nur für die nächsten 90 Tage aktiv geschaltet ist. Danach ist eine Verlängerung der Abrufveranstaltung über diesen Link nicht mehr möglich.

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
