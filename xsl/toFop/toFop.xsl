<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" version="1.0" indent="yes"/>
	<xsl:include href="style.xsl"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--def de format(s) de papier-->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4-portrait" page-height="297mm" page-width="210mm">
					<fo:region-body background-image="{/photos/@theme}" margin-top="2cm"/>
					<fo:region-before extent="2cm" background-image="{/photos/@theme}"/>
					<fo:region-after extent="1cm" background-image="{/photos/@theme}"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--def de sequence(s) de page(s)-->
			<fo:page-sequence master-reference="A4-portrait">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block xsl:use-attribute-sets="external-region big underline">
						<xsl:value-of select="/photos/titre"/>
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block xsl:use-attribute-sets="external-region" font-size="12pt">
						<fo:page-number/>/<fo:page-number-citation ref-id="last-page"/>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:apply-templates select="//page"/>
						<fo:block id="last-page"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="page">
		<fo:block page-break-before="always">
			<fo:table>
				<!--<fo:table-column column-width="100mm"/>
				<fo:table-column column-width="100mm"/>-->
				<fo:table-body>
					<fo:table-row height="130mm">
						<xsl:apply-templates select=".//image[position() &lt;= 2]"/>
					</fo:table-row>
					<xsl:if test="count(.//image)>2">
						<fo:table-row height="130mm">
							<xsl:apply-templates select=".//image[position() > 2]"/>
						</fo:table-row>
					</xsl:if>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template match="image">
		<fo:table-cell>
			<fo:block text-align="center" display-align="center">
				<!--<fo:external-graphic src="{$img/@path}{$img/@href}" content-height="97mm" content-width="97mm" scaling="uniform"/>-->
				<fo:external-graphic src="{concat(@path,@href)}" content-height="97mm" content-width="97mm" scaling="uniform"/>
				<fo:block/>
				<xsl:value-of select="."/>
				<xsl:if test="/photos/@OnlyComment='false'">
					<fo:block/>
					<xsl:value-of select="@href"/>
				</xsl:if>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>