<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<xsl:for-each select="xmldata/data">
			
			Betreff: 2. Erinnerung - Beantragung der Reakkreditierung als Anbieter

			Sehr geehrter Anbieter,

			möglicherweise ist unser Schreiben mit der Erinnerung an Ihre Reakkreditierung Ihrer Aufmerksamkeit entgangen.

			Wir haben Sie darauf hingewiesen, dass Ihre Akkreditierung als Anbieter von Fortbildungsangeboten am <xsl:value-of select="@ENDE_DATUM" /> endet. Bisher haben Sie Ihre Reakkreditierung nicht beantragt. Sie können dann keine Angebote und Veranstaltungen mehr eingeben bzw. bearbeiten. Ihre Veranstaltungen und Sie als Anbieter werden nicht mehr in den entsprechenden Katalogen gelistet.

			Beantragen Sie die Reakkreditierung bitte innerhalb 1 Woche, andernfalls wird Ihre Akkreditierung auslaufen.

			Wenn Sie die Reakkreditierung nicht beantragen möchten, so betrachten Sie dieses Schreiben bitte als gegenstandslos.

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
