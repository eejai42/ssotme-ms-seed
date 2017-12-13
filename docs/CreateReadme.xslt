﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="output-filename" select="'output.txt'" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>README.md</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"># Morse Code SDK
This is a simple library for morse code.

Character <xsl:for-each select="//Variant"> | <xsl:value-of select="Name" /></xsl:for-each> |
--- <xsl:for-each select="//Variant"> | --- </xsl:for-each> |
<xsl:for-each select="//RawCharacters/Character"><xsl:variable name="char" select="." /><xsl:value-of select="Name"/> <xsl:for-each select="//Variant"> | <xsl:call-template name="print-char"><xsl:with-param name="char" select="$char" /><xsl:with-param name="variant" select="." /></xsl:call-template></xsl:for-each> |
</xsl:for-each>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
    <xsl:template name="print-char" xml:space="default">
        <xsl:param name="char" />
        <xsl:param name="variant" />
        <xsl:text>`</xsl:text>
        <xsl:for-each select="$variant//Character[Name = $char/Name]//Signal">
            <xsl:value-of select="DisplayText"/>
            <img src="https://eejai42.github.io/MorseCodeSDK/images/Dash.png" />
        </xsl:for-each>
        <xsl:text>`</xsl:text>
    </xsl:template>
</xsl:stylesheet>
