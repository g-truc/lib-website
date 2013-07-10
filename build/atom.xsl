<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="constants.xsl" />
	<xsl:include href="util.xsl" />
	<xsl:include href="util-atom.xsl" />

	<xsl:template match="website">
    	<feed xmlns="http://www.w3.org/2005/Atom">
			<title>
				<xsl:value-of select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-title']/@value" />
			</title>
			<subtitle>
				<xsl:value-of select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-title']/@value" />
			</subtitle>
			<link rel="self" type="application/atom+xml" href="{concat(document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-url']/@value, '/feed.atom')}" />
			<link rel="alternate"	type="text/html" lang="en" href="{concat(document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-url']/@value, '/index.html')}"/>
			<id>
				<xsl:value-of select="concat(document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-url']/@value, '/index.html')" />
			</id>
			<updated>
				<xsl:value-of select="./post[1]/@std-date" />
			</updated>
			<author>
				<name>
					<xsl:value-of select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-author']/@value" />
				</name>
			</author>

			<xsl:apply-templates select="./post[10>=position()]" mode="atom" />
		</feed>
	</xsl:template>

	<xsl:template match="post" mode="atom">
		<entry xmlns="http://www.w3.org/2005/Atom">
			<title>
				<xsl:value-of select="./@title"/>
			</title>
			<link lang="en" rel="self" type="application/atom+xml" href="{concat(document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-url']/@value, '/feed.atom')}" />
			<link lang="en" rel="alternate" type="text/html" href="{concat(document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-url']/@value, '/index.html')}"/>
			<id>
				<xsl:value-of select="concat(document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-url']/@value, 'index', ./@index, '.html')" />
			</id>
			<updated>
				<xsl:value-of select="./@std-date" />
			</updated>
			<content type="xhtml" xml:lang="en">
				<div xmlns="http://www.w3.org/1999/xhtml" class="atom-content">
					<xsl:apply-templates />
				</div>
			</content>
		</entry>
	</xsl:template>

</xsl:stylesheet>
