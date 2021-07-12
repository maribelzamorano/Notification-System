<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">

			Betreff: Anbieterprofil geändert
			Werte Mitarbeiter der Akkreditierungsstelle,
			die Daten des akkreditierten Anbieters
			<xsl:value-of select="@ABIE_NUMMER" />
			wurden vom Anbieter
			am <xsl:value-of select="@ABIE__x005F_x0023_PTS" />
			geändert und sind zu prüfen.
	
		</xsl:for-each>

	</xsl:template>
	
</xsl:stylesheet>

