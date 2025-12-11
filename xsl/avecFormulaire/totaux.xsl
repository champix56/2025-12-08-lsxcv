<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="idclient" select="''"/>
	<xsl:param name="tx" select="0.20"/>
	<!--<xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>-->
	<xsl:template match="/">
		<table>
			<tr>
				<th colspan="2">Tableaux des totaux pour le(s) clients suivants :
					<xsl:choose>
					<!--affichage depuis tous les noeuds XML @idclient si pas de valeur de param sinon tous les noeuds @idclient-->
						<xsl:when test="string-length($idclient)>0">
							<xsl:text> </xsl:text>
							<xsl:value-of select="$idclient"/>
						</xsl:when> 
						<xsl:otherwise>
							<xsl:apply-templates select=" //@idclient"/>
						</xsl:otherwise>
					</xsl:choose>
				
				</th>
			</tr>
			<xsl:variable name="totalHT">
				<xsl:choose>
				<!--remplissage de valeur de total soit pour le client en param soit tous les clients-->
					<xsl:when test="string-length($idclient)>0">
						<xsl:value-of select=" format-number(sum(//facture[@idclient=$idclient]//stotligne),'0.00')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select=" format-number(sum(//facture//stotligne),'0.00')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="totalTVA">
				<xsl:value-of select="format-number($totalHT*$tx,'0.00')"/>
			</xsl:variable>
			<tr>
				<td>Montant total HT</td>
				<th>
					<xsl:value-of select="format-number($totalHT,'0.00&#x20AC;')"/>
				</th>
			</tr>
			<tr>
				<td>Montant total HT</td>
				<th>
					<xsl:value-of select="format-number($totalTVA,'0.00&#x20AC;')"/>
				</th>
			</tr>
			<tr>
				<td>Montant total HT</td>
				<th>
					<xsl:value-of select="format-number($totalHT+$totalTVA,'0.00&#x20AC;')"/>
				</th>
			</tr>
		</table>
	</xsl:template>
	<!--affichage des id client provenant de noeud XML-->
	<xsl:template match="@idclient">
		<xsl:text> </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>