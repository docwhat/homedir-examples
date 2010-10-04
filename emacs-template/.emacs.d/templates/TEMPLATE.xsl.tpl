<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:math= "http://exslt.org/math"
    xmlns:str = "http://exslt.org/strings"
    xmlns:dyn = "http://exslt.org/dynamic"
    xmlns:exsl= "http://exslt.org/common"
    xmlns:set = "http://exslt.org/sets"
    xmlns:date= "http://exslt.org/dates-and-times"
    xmlns:func= "http://exslt.org/functions"
    xmlns:lib = "http://xmlsoft.org/XSLT/namespace"
    xmlns:viv = "http://vivisimo.com/exslt"
    extension-element-prefixes="math str dyn exsl set date func lib viv" >

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    (>>>POINT<<<)
  </xsl:template>

</xsl:stylesheet>
