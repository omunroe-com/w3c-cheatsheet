<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="html">

<!-- Output method XML -->
<xsl:output method="xml" indent="yes"
  encoding="utf-8" 
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  />

<xsl:variable name="manuallyDefined">
  <dl xmlns="http://www.w3.org/1999/xhtml">
    <dt>'prefetch'</dt>
    <dd>The 'prefetch'  element provides a hint to the SVG user agent  that media will be used in the future and the author would like part or all of it fetched ahead of time to make document playback smoother.</dd>
    <dt>'listener'</dt>
    <dd>The 'listener' element is used to declare event listeners and register them with specific nodes in the DOM.</dd>
    <dt>'path'</dt>
    <dd>Paths represent the outline of a shape which can be filled or stroked. A path is defined in SVG using the 'path' element.</dd>
    <dt>'linearGradient'</dt>
    <dd>Linear gradients are defined by a 'linearGradient' element.</dd>
    <dt>'radialGradient'</dt>
    <dd>Radial gradients are defined by a 'radialGradient' element.</dd>
    <dt>'tbreak'</dt>
    <dd>The 'tbreak' element is an empty element that forcibly breaks the current line of text, even if the current line of text is empty (i.e. multiple consecutive 'tbreak' elements each cause a line break.) </dd>
    <dt>'script'</dt>
    <dd>A 'script' element may either contain or point to executable content (e.g., ECMAScript or Java JAR file).</dd>
    <dt>'use'</dt>
    <dd>The 'use' element references another element and indicates that the graphical contents of that element is to be included and drawn at that given point in the document.</dd>
    <dt>'textArea'</dt>
    <dd>The 'textArea' element allows simplistic wrapping of text content within a given region.</dd>
  </dl>
  <dl xmlns="http://www.w3.org/1999/xhtml">
    <dt>'opacity'</dt>
    <dd>Uniform opacity setting that must applied across an entire object.</dd>
    <dt>'pointer-events'</dt>
    <dd>The 'pointer-events' property specifies under what circumstances a given graphics element can be the target element for a pointer event.</dd>
    <dt>'stroke-width'</dt>
    <dd>The width of the stroke which shall be used on the current object.</dd>
    <dt>'text-align'</dt>
    <dd>Alignment in the inline progression direction in flowing text is provided by the text-align property.</dd>
    <dt>'text-anchor'</dt>
    <dd>The 'text-anchor' property is used to align a string of text relative to a given point, along a given axis.</dd>
    <dt>'unicode-bidi'</dt>
    <dd>The 'unicode-bidi' property describes the level of embedding with respect to the bidirectional algorithm.</dd>
    <dt>'vector-effect'</dt>
    <dd>The 'vector-effect' property allows to let the outline of an object keep its original width no matter which transforms are applied to it. For example, in a map with a 2px wide line representing roads it is of interest to keep the roads 2px wide even when the user zooms into the map.</dd>
    <dt>'viewport-fill'</dt>
    <dd>The 'viewport-fill' property specifies the color which shall be used to fill the viewport created by a particular element.</dd>
    <dt>'visibility'</dt>
    <dd>The 'visibility' property specifies whether the boxes generated by an element are rendered. Invisible boxes still affect layout (set the 'display' property to 'none' to suppress box generation altogether).</dd>
  </dl>  
</xsl:variable>
  <xsl:variable name="svg" select="document('http://www.w3.org/TR/2008/REC-SVGTiny12-20081222/single-page.html')/html:html/html:body"/>

  <xsl:template match="/">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Descriptions of SVG elements and attributes</title>
<link type="text/css" rel="stylesheet" href="/StyleSheets/base" />
</head>
<body>
<p><a href="/" title="W3C"><img height="48" width="72" alt="W3C"
src="http://www.w3.org/Icons/w3c_home" /></a></p>

<h1>Descriptions of SVG elements and attributes</h1>

<p>Partially automatically extracted from <a href="http://www.w3.org/TR/2008/REC-SVGTiny12-20081222/single-page.html">the SVG Tiny 1.2 specification</a>.</p>

<h2>Elements</h2>

<dl>
    <xsl:for-each select="document('http://www.w3.org/TR/2008/REC-SVGTiny12-20081222/elementTable.html')/html:html//html:table/html:tbody/html:tr">
     <dt><code><xsl:value-of select="html:td[1]"/></code></dt>
     <dd><xsl:choose>
       <xsl:when test="$manuallyDefined/html:dl[1]/html:dt[.=current()/html:td[1]]">
	 <xsl:value-of select="$manuallyDefined/html:dl[1]/html:dt[.=current()/html:td[1]]/following-sibling::html:dd[1]"/>
       </xsl:when>
       <xsl:otherwise><xsl:value-of select='substring-before(concat(normalize-space($svg//*[local-name()="h2" or local-name()="h3" or local-name()="h4"][html:span[@class="element-name"][.=current()/html:td[1]] and contains(lower-case(.)," the ")][1]/following-sibling::html:p[1])," "),". ")'/><xsl:text>.</xsl:text>
       </xsl:otherwise>
     </xsl:choose></dd>
    </xsl:for-each>
</dl>

<h2>Properties</h2>
<dl>
    <xsl:for-each-group select="document('http://www.w3.org/TR/2008/REC-SVGTiny12-20081222/attributeTable.html')/html:html//html:table[1]/html:tbody/html:tr" group-by="normalize-space(html:td[1])">
      <dt><xsl:value-of select="html:td[1]"/></dt>
      <dd>
	<xsl:choose>
	  <xsl:when test="$manuallyDefined/html:dl[2]/html:dt[.=current()/html:td[1]]">
	    <xsl:value-of select="$manuallyDefined/html:dl[2]/html:dt[.=current()/html:td[1]]/following-sibling::html:dd[1]"/>
	  </xsl:when>
	  <xsl:when test='$svg//html:div[@class="propdef"][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/following-sibling::html:*[1][local-name()="p"][contains(.,translate(current()/html:td[1],"&apos;",""))]'>
	    <xsl:value-of select="normalize-space($svg//html:div[@class='propdef'][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/following-sibling::html:p[1])"/></xsl:when>
	  <xsl:when test='$svg//html:div[@class="propdef"][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/preceding-sibling::html:*[1][local-name()="p"][contains(.,translate(current()/html:td[1],"&apos;",""))]'>
	    <xsl:value-of select="normalize-space($svg//html:div[@class='propdef'][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/preceding-sibling::html:p[1])"/></xsl:when>
	  <xsl:when test="$svg//html:div[@class='propdef'][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/following-sibling::html:*[1][local-name()='p']">
	    <xsl:value-of select="normalize-space($svg//html:div[@class='propdef'][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/following-sibling::html:p[1])"/></xsl:when>
	  <xsl:when test="$svg//html:div[@class='propdef'][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/preceding-sibling::html:*[1][local-name()='p']">
	    <xsl:value-of select="normalize-space($svg//html:div[@class='propdef'][.//html:dt[normalize-space()=normalize-space(current()/html:td[1])]]/preceding-sibling::html:p[1])"/></xsl:when>
	</xsl:choose>
      </dd>
    </xsl:for-each-group>
</dl>
<!--
<h2>Attributes</h2>
<dl>
    <xsl:for-each-group select="document('http://www.w3.org/TR/2008/REC-SVGTiny12-20081222/attributeTable.html')/html:html//html:table[2]/html:tbody/html:tr" group-by="normalize-space(html:td[1])">
      <dt><xsl:value-of select="html:td[1]"/></dt>
      
    </xsl:for-each-group>
</dl>
-->
</body>
</html>
  </xsl:template>
</xsl:stylesheet>