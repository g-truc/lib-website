<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
  <xsl:variable name="WEBSITE_FEED">http://feeds.feedburner.com/g-truc</xsl:variable>

  <xsl:variable name="FILE_POST">data.xml</xsl:variable>
  <xsl:variable name="FILE_PROJ">project.xml</xsl:variable>
  <xsl:variable name="FILE_DOWN">download.xml</xsl:variable>
  <xsl:variable name="FILE_TMPL">template.xml</xsl:variable>
  <xsl:variable name="FILE_BULD">build.xml</xsl:variable>
  <xsl:variable name="FILE_MENU">menu.xml</xsl:variable>
  <xsl:variable name="FILE_CODE">code.xml</xsl:variable>
  <xsl:variable name="FILE_CNST">constants.xml</xsl:variable>

  <xsl:variable name="ANCHOR_MENU_NAME">menu</xsl:variable>
  <xsl:variable name="ANCHOR_MENU_LINK">#menu</xsl:variable>

  <xsl:variable name="THEME_NAME_ORANGE">orange</xsl:variable>
  <xsl:variable name="THEME_CURRENT"><xsl:value-of select="$THEME_NAME_ORANGE"/></xsl:variable>

  <xsl:param name="VERSION" select="index" />
  <xsl:param name="DIRECTORY" />
</xsl:stylesheet>
