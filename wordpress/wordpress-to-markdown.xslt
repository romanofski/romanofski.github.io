<?xml version="1.0" ?>
<xsl:stylesheet version="3.0"
                xmlns:content="http://purl.org/rss/1.0/modules/content/"
                xmlns:wp="http://wordpress.org/export/1.2/"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" indent="no" />
  <!--
  <xsl:mode on-no-match="deep-skip"/>
      -->

  <xsl:template match="channel/item">
    <xsl:if test="wp:post_type[contains(., 'post')]">
      <xsl:variable name="dt" select="xs:dateTime(
                                        concat(
                                        substring(wp:post_date,1,10), 'T',
                                        substring(wp:post_date,12,20)
                                        ))"/>
      <xsl:variable name="dtYear" select="format-dateTime($dt,'[Y0001]')" />
      <xsl:variable name="dtMonth" select="format-dateTime($dt,'[M01][D01]')" />
      <xsl:variable name="dtTime" select="format-dateTime($dt,'[Y0001]-[M01]-[D01]-[H01]-[M01]')" />
      <xsl:variable name="filename" select="concat('posts/', $dtTime, '.markdown')" />

      <xsl:result-document href="{$filename}">---
title: "<xsl:value-of select="translate(title,'&#x0d;&#x0a;', '')"/>"
tags: <xsl:for-each select="category[@domain = 'post_tag']">
- <xsl:value-of select="." />
</xsl:for-each>
---

<xsl:apply-templates select="content:encoded" />
      </xsl:result-document>
    </xsl:if>
  </xsl:template>

  <xsl:template match="content:encoded">
    <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>
