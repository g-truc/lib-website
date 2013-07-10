<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:strip-space elements="*" />

	<xsl:output 
		method="xml"
		media-type="application/xhtml+xml; charset=iso-8859-1"
		version="1.0"
		encoding="iso-8859-1"
		standalone="no"
		omit-xml-declaration="no"
		doctype-public="-//W3C//DTD XHTML 1.1//EN" 
		doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
		indent="no" />

	<xsl:template name="page-head">
		<xsl:param name="Title" />
	
		<head xmlns="http://www.w3.org/1999/xhtml">
			<title><xsl:value-of select="$Title" /></title>
		  	<meta http-equiv="Content-Language" content="en" />
		  	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=iso-8859-1" />
		  	<meta name="copyright" content="{document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='copyright-title']/@value}" />
		  	<link href="../common/style.css" rel="stylesheet" media="screen, print, embossed" type="text/css" />
			<link href="../common/code.css" rel="stylesheet" media="screen, print, embossed" type="text/css" />

      		<script type="text/javascript">
        		var _gaq = _gaq || [];
        		_gaq.push(['_setAccount', 'UA-20182250-1']);
        		_gaq.push(['_setDomainName', '.g-truc.net']);
        		_gaq.push(['_trackPageview']);

        		(function() 
        		{
        			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        		})();
      		</script>
	  	</head>  
	</xsl:template>

  	<xsl:template name="page-foot">
		<div xmlns="http://www.w3.org/1999/xhtml" class="copyright">
        	<xsl:value-of select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='copyright']/@value" />
        	<xsl:text> </xsl:text>
    		<a href="{document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='copyright-url']/@value}">
    			<xsl:value-of select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='copyright-title']/@value" />
    		</a>
		</div>
	</xsl:template>
	
	<xsl:template match="version">
    	<xsl:choose>
        	<xsl:when test="$VERSION=./@value">
				<a xmlns="http://www.w3.org/1999/xhtml" class="active" href="{concat('../', ./@value, '/index.html')}">
					<xsl:value-of select="./@value" />
				</a>
        	</xsl:when>
        	<xsl:otherwise>
				<a xmlns="http://www.w3.org/1999/xhtml" href="{concat('../', ./@value, '/index.html')}">
					<xsl:value-of select="./@value" />
				</a>
        	</xsl:otherwise>
      	</xsl:choose>
		<xsl:text> </xsl:text>
	</xsl:template>	

	<xsl:template match="tab">
		<xsl:choose>
        	<xsl:when test="./@active='yes'">
				<a xmlns="http://www.w3.org/1999/xhtml" href="{./@href}" class="active"><xsl:value-of select="./@name"/></a><xsl:text> </xsl:text>
        	</xsl:when>
			<xsl:otherwise>
				<a xmlns="http://www.w3.org/1999/xhtml" href="{./@href}"><xsl:value-of select="./@name"/></a><xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="menu">
        <div xmlns="http://www.w3.org/1999/xhtml" class="menu-entry1">
        	<xsl:if test="./@title">
            	<xsl:value-of select="./@title"/>
        	</xsl:if>
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="menu-entry">
	  <div xmlns="http://www.w3.org/1999/xhtml" class="menu-entry2">
		<a href="{./@href}" class="menu">
		  <xsl:value-of select="./@name"/>
		</a>
	  </div>
	</xsl:template>
	
	<xsl:template name="page-menu">	
		<div xmlns="http://www.w3.org/1999/xhtml" class="menu">
			<div xmlns="http://www.w3.org/1999/xhtml" class="menu-logo">
		  		<a href="{document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='splash']/@value}">
					<img class="menu-img" src="{document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='logo']/@value}" alt="Logo"/>
				</a>
			</div>
			
			<xsl:if test="document(concat($DIRECTORY, $FILE_DOWN))/website/download">
				<div xmlns="http://www.w3.org/1999/xhtml" class="menu-entry1">
					<a class="menu" href="{document(concat($DIRECTORY, $FILE_DOWN))/website/download[contains(@version, $VERSION)][1]/item[./@type='ZIP']/@href}">
						<xsl:text>Download </xsl:text>
						<xsl:value-of select="document(concat($DIRECTORY, $FILE_DOWN))/website/download[contains(@version, $VERSION)][1]/@title" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="document(concat($DIRECTORY, $FILE_DOWN))/website/download[contains(@version, $VERSION)][1]/@version" />
	 				</a>
				</div>
			</xsl:if>
			
	  		<xsl:apply-templates select="document(concat($DIRECTORY, $FILE_MENU))/website/version[./@value=$VERSION]/menu" />
	  		
	  		<br />
			<div xmlns="http://www.w3.org/1999/xhtml">
				<a href="http://www.g-truc.net">
					<img class="menu-img" src="../common/g-truc.jpg" alt="G-Truc Creation"/>
				</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="link">
		<a href="{./@href}"><xsl:value-of select="." /></a>
	</xsl:template>

	<xsl:template match="entry">
		<li xmlns="http://www.w3.org/1999/xhtml">
          	<!--xsl:if test="./@type">
            	<xsl:text>: </xsl:text>
            	<xsl:value-of select="./@tag"/>
          	</xsl:if-->			
			<xsl:choose>
				<xsl:when test="./@href">
					<a href="{./@href}">
						<xsl:apply-templates />
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>

	<xsl:template match="download">
    	<xsl:param name="Index" select="./@index" />
    	<xsl:param name="Download" select="document(concat($DIRECTORY, $FILE_DOWN))/website/download[@version=$Index]" />

    	<li xmlns="http://www.w3.org/1999/xhtml">
    		<xsl:text>Download: </xsl:text>
      		<a href="{$Download/item[1]/@href}">
          		<xsl:value-of select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-short']/@value" />
          		<xsl:text> </xsl:text>
          		<xsl:value-of select="$Download/@version" />
      		</a>
			
			<xsl:for-each select="$Download/item">
				<xsl:text> (</xsl:text>
        		<a href="{./@href}">
          			<xsl:value-of select="./@type"/>
          			<xsl:if test="./@size">
            			<xsl:text>, </xsl:text>
            			<xsl:value-of select="./@size"/>
          			</xsl:if>
        		</a>
        		<xsl:text>) </xsl:text>
      		</xsl:for-each>
    	</li>
  </xsl:template>

	<xsl:template match="list">
		<p xmlns="http://www.w3.org/1999/xhtml">
			<ul>
				<xsl:if test="./@title">
					<li class="title">
						<xsl:choose>
							<xsl:when test="./@href">
								<a href="{./@href}">
									<xsl:value-of select="./@title" />
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="./@title" />
							</xsl:otherwise>
						</xsl:choose>
					</li>
				</xsl:if>
				<xsl:apply-templates />
			</ul>
		</p>
	</xsl:template>

  <xsl:template match="image">
    <xsl:choose>
      <xsl:when test="contains(./@color, 'white')">
        <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-white">
          <a href="{./@href}">
            <img src="{./@img}" alt="{./@title}" />
          </a>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-black">
          <a href="{./@href}">
            <img src="{./@img}" alt="{./@title}" />
          </a>
        </div>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./@title">
      <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-title">
        <xsl:value-of select="./@title"/>
      </div>
    </xsl:if>
  </xsl:template>

	<xsl:template match="paragraph">
		<p><xsl:text /><xsl:apply-templates /><xsl:text /></p>
	</xsl:template>

	<xsl:template match="about-short">
	  <h2>
		<xsl:value-of select="." />
	  </h2>
	</xsl:template>

	<!-- Elements for code listing -->
	<xsl:template match="code">
		<xsl:if test="./@title">
			<xsl:choose>
				<xsl:when test="./@href">
					<span xmlns="http://www.w3.org/1999/xhtml" class="code-title">
						<a href="{./@href}">
							<xsl:value-of select="./@title" />
						</a>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span xmlns="http://www.w3.org/1999/xhtml" class="code-title">
						<xsl:value-of select="./@title" />
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<ul xmlns="http://www.w3.org/1999/xhtml" class="code-list">
			<xsl:apply-templates select="./line" />
		</ul>
	</xsl:template>

	<xsl:template match="line">
		<li xmlns="http://www.w3.org/1999/xhtml" class="code-line">
			<xsl:choose>
				<xsl:when test="@align">
					<span class="code-line-content" style="padding-left:{@align}">
						<xsl:apply-templates />
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="code-line-content">
						<xsl:apply-templates />
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>

  <xsl:template match="keyword">
    <span xmlns="http://www.w3.org/1999/xhtml" class="keyword">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="userword">
    <span xmlns="http://www.w3.org/1999/xhtml" class="userword">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="codeword">
    <span xmlns="http://www.w3.org/1999/xhtml" class="codeword">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

	<xsl:template match="string">
		<span xmlns="http://www.w3.org/1999/xhtml" class="string">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="comment">
		<span xmlns="http://www.w3.org/1999/xhtml" class="comment">
			<xsl:apply-templates />
		</span>
	</xsl:template>	
</xsl:stylesheet>
