<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="array fn map math xhtml xs err" version="3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/" name="xsl:initial-template">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="-102 -102 204 204" width="100%" height="100%">
			<desc>
				<!-- put a description here -->
			</desc>
			<line x1="0" y1="0" x2="100" y2="0" stroke-width="1" stroke="black"/>
			<g>
				<circle r="1" cx="0" cy="0" stroke="black" fill="black"/>
				<circle r="100" cx="0" cy="0" stroke="black" fill="none"/>
				<circle r="50" cx="0" cy="0" stroke="black" stroke-width="0.3" stroke-dasharray="5 5" fill="none"/>
				<!-- your graphic here -->
			</g>
		</svg>
	</xsl:template>
</xsl:stylesheet>