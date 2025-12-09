<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
				<style type="text/css">
					/*style css*/
					@media print{
						.facture{
							page-break-before:always;
							height:27cm;
						}
					}
					.facture{
						width:20cm;
						/*border:1px solid black;*/
					}
					.bloc-adresse{
						width:6cm;
						height:4cm;
						border:1px solid black;
					}
					.emeteur{}
					.client{
						margin-left:12cm;
					}
					.numerofacture{
						border:1px solid black;
						background-color:#ACACAC;
						text-align:center;
						margin:2cm 4cm;
						padding:0.3cm;
						font-weight:900;
						font-size:large;
					}
					.table-container{
						padding:0 1cm;
					}
					table{
						width:100%;
						border-spacing: 0;
						border-collapse: collapse;
					}
					table td, table th{
						border:1px solid black;
					}
					table thead{
						background-color:#AFAFAF;
					}
					.no-border{
						border:none ;
						text-align:right ;
					}
				</style>
			</head>
			<body>
				<xsl:apply-templates select="//facture"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="facture">
		<div class="facture">
			<div class="emeteur bloc-adresse">emeteur</div>
			<div class="client bloc-adresse">client</div>
			<div class="numerofacture">numero facture</div>
			<div class="table-container">
				<table>
					<thead>
						<tr>
							<th>REF</th>
							<th>designation</th>
							<th>€/unit.</th>
							<th>quant.</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select=".//ligne"/>
						<tr>
							<td class="no-border" colspan="4">Montant total HT :</td>
							<th/>
						</tr>
						<tr>
							<td class="no-border" colspan="4">Montant TVA 20% :</td>
							<th/>
						</tr>
						<tr>
							<td class="no-border" colspan="4">Montant total TTC :</td>
							<th/>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ligne">
		<tr>
			<xsl:apply-templates select="*[name()!='surface']"/>
			<!--<xsl:apply-templates select="nbUnit|ref|designation"/>-->
		</tr>
	</xsl:template>
	<!--
l'un ou lautre (filtrage par nom de balise dans une position) ou (pipe sur no de balise ATTENTION aux priorités de match)
<xsl:template match="ligne/*[name()='stotligne' or name()='phtByUnit']" priority="1">-->
	<xsl:template match="stotligne | phtByUnit" priority="1">
		<td>
			<xsl:value-of select="."/>€
		</td>
	</xsl:template>
	<xsl:template match="ligne/*">
		<td>
			<xsl:value-of select="."/>
		</td>
	</xsl:template>
</xsl:stylesheet>