<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" media-type="text/html; charset=ISO-8859-1" />

	<xsl:include href="./constants.xsl" />
	<xsl:include href="./util.xsl" />

	<xsl:template match="/">
		<html>
    	<xsl:call-template name="page-head">
			<xsl:with-param name="Title" select="document($FILE_CNST)/website/constant[./@name='website-title']/@value" />
		</xsl:call-template>

		<body>
			<div class="root">
				<div class="version">
					<div>
						<a href="http://glm.g-truc.net" class="active">GLM</a><xsl:text> </xsl:text>
						<a href="http://gli.g-truc.net">GLI</a><xsl:text> </xsl:text>
						<a href="http://glo.g-truc.net">GLO</a><xsl:text> </xsl:text>
						<a href="http://glu.g-truc.net">GLU</a>
					</div>
					<xsl:apply-templates select="document($FILE_MENU)/website/version" />
				</div>
        		<table>
          			<tr>
            		<td class="menu">
        	    		<xsl:call-template name="page-menu" />
    	        	</td>
	            	<td class="page">
              			<div class="title1">
              				<xsl:value-of select="document($FILE_CNST)/website/constant[./@name='website-title']/@value"/>
              			</div>
            	  		<div class="title2">
        	      			<xsl:apply-templates select="./website/about-short" />
				  		</div>
				  		<br />
			  			<xsl:apply-templates select="./website/about-long" />
			  			<br />
            			<xsl:call-template name="page-foot" />
        	    	</td>
    	      		</tr>
	        	</table>		
			</div>
      	</body>
    	</html>
	</xsl:template>
</xsl:stylesheet>
