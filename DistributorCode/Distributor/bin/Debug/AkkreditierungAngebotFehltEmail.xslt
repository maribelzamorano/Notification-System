<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">

Betreff: Fehlende Akkreditierung eines Angebotes im Status "Akkreditierung beantragt"
Werte Mitarbeiter der Akkreditierungsstelle,
für das Angebot
<xsl:value-of select="@ANBO_NUMMER" />
Thema: <xsl:value-of select="@ANBO_THEMA" />
wurde die Akkreditierung beantragt.
Dieser Antrag muss bevorzugt bearbeitet werden, da die Veranstaltung
<xsl:value-of select="@VESG_NR" />
Datum: <xsl:value-of select="@VESG_BEGINN" />
in weniger als 2 Wochen stattfindet.

		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>
