<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" media-type="text/html; charset=ISO-8859-1" />

  <xsl:include href="./constants.xsl" />
  <xsl:include href="./util.xsl" />

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <xsl:call-template name="page-head">
        <xsl:with-param name="Title" select="document(concat($DIRECTORY, $FILE_CNST))/website/constant[./@name='website-title']/@value" />
      </xsl:call-template>

      <body>
        <div class="root">
          <div class="version">
            <div>
              <xsl:apply-templates select="document(concat($DIRECTORY, $FILE_MENU))/website/tab" />
            </div>
            <xsl:apply-templates select="document(concat($DIRECTORY, $FILE_MENU))/website/version" />
          </div>
          <table>
            <tr>
              <td class="menu">
                <xsl:call-template name="page-menu" />
              </td>
              <td class="page">
                <h3><xsl:text>Code samples</xsl:text></h3>
                <xsl:apply-templates select="document(concat($DIRECTORY, $FILE_CODE))/website/code[contains($VERSION, @version)]" />
              </td>
            </tr>
          </table>
        </div>
        </body>
      </html>
  </xsl:template>
</xsl:stylesheet>
