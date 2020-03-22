<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math xd xsl uml xmi umldi dc fn"
    xmlns:uml="http://www.omg.org/spec/UML/20131001"
    xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
    xmlns:umldi="http://www.omg.org/spec/UML/20131001/UMLDI"
    xmlns:dc="http://www.omg.org/spec/UML/20131001/UMLDC" xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:functx="http://www.functx.com"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dct="http://purl.org/dc/terms/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:f="http://https://github.com/costezki/model2owl#" version="3.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Mar 22, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> lps</xd:p>
            <xd:p>A set of useful utilities</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:import href="../config-parameters.xsl"/>

    <xd:doc>
        <xd:desc>Lookup a data-type in the xsd and rdf accepted data-type document (usually an
            external file with xsd and rdf data-types definitions) and return false or the data-type
            name if it exists</xd:desc>
        <xd:param name="qname"/>
        <xd:param name="dataTypesDefinitions"/>
    </xd:doc>
    <xsl:function name="f:getXsdRdfDataTypeValues" as="xs:string">
        <xsl:param name="qname"/>
        <xsl:param name="dataTypesDefinitions"/>
        <xsl:sequence
            select="string($dataTypesDefinitions/*:datatypes/*:datatype[@qname = $qname]/@qname)"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Lookup a prefix in the namespaceDefinitions (usually an external file with
            namespace definitions) and return the namespace corresponding to the prefix or false if
            is an invalid prefix</xd:desc>
        <xd:param name="prefix"/>
        <xd:param name="namespaceDefinitions"/>
    </xd:doc>
    <xsl:function name="f:getNamespaceValues" as="xs:string">
        <xsl:param name="prefix"/>
        <xsl:param name="namespaceDefinitions"/>
        <xsl:sequence
            select="string($namespaceDefinitions/*:prefixes/*:prefix/@value[../@name = $prefix])"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Lookup an uml data-type in the docmuents that presents a mapping with the xsd
            data-type(usually an external file with mapping between uml data-type and xsd data-type)
            and if found convert data-type from uml to xsd or return false</xd:desc>
        <xd:param name="qname"/>
        <xd:param name="umlDataTypeMappings"/>
    </xd:doc>
    <xsl:function name="f:getUmlDataTypeValues" as="xs:string">
        <xsl:param name="qname"/>
        <xsl:param name="umlDataTypeMappings"/>
        <xsl:variable name="dataType"
            select="$umlDataTypeMappings/*:mappings/*:mapping/from/@qname = $qname"/>
        <xsl:sequence
            select="string($umlDataTypeMappings/*:mappings/*:mapping/*:to[../from/@qname = $qname]/@qname)"
        />
    </xsl:function>

    <xd:doc>
        <xd:desc>Build the QName for a lexicalQName (the string equivalent of the QName). The prefix
            definition is fetched from the global resource '$namespacePrefixes'.</xd:desc>
        <xd:param name="lexicalQName"/>
    </xd:doc>
    <xsl:function name="f:buildQNameFromLexicalQName" as="xs:QName">
        <xsl:param name="lexicalQName" as="xs:string"/>

        <xsl:variable name="prefix" select="fn:substring-before($lexicalQName, ':')"/>
        <xsl:variable name="namespaceURI" select="f:getNamespaceValues($prefix, $namespacePrefixes)"/>
        <!--<xsl:sequence select="fn:QName($namespaceURI, $lexicalQName)"/>-->
        <xsl:choose>
            <xsl:when test="($namespaceURI != '') and boolean(string(xs:anyURI($namespaceURI)))">
                <xsl:sequence select="fn:QName($namespaceURI, $lexicalQName)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">ERROR: Prefix '<xsl:value-of select="$prefix"/>' has no
                    namespace definition. Please check 'config-parameters.xsl' and/or the content of
                    'namespaces.xml'</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>



    <xd:doc>
        <xd:desc> generates URI from the lexicalQName. The prefix definition is fetched from the
            global resource '$namespacePrefixes'. The base URI must have a fragment identifier 
            (hash '#' , or slash '/') by default the slash '/' is assumed. 
            
            
            In order to be compatible 
            with 'fn:resolve-uri' the ending fragment identifier from the base URI is moved to the 
            begining of the local segment. THis could probably changed by relying on a simple 
            concatenation, but at the cost of missing some additional checks that the 'fn:resolve-uri' does.
            
            Finally concatenation solution WON! 
        </xd:desc>
        <xd:param name="lexicalQName"/>
    </xd:doc>
    <xsl:function name="f:buildURIfromLexicalQName">
        <xsl:param name="lexicalQName"/>
        <xsl:variable name="qname" select="f:buildQNameFromLexicalQName($lexicalQName)"/>
        <xsl:variable name="namespaceURI" select="fn:namespace-uri-from-QName($qname)"/>
        <xsl:variable name="fragmentIdentifier"
            select="substring($namespaceURI, string-length($namespaceURI), 1)"/>

        <xsl:choose>
            <xsl:when test="substring($namespaceURI, string-length($namespaceURI), 1) = '#'">
                <xsl:sequence select="xs:anyURI(fn:concat(fn:namespace-uri-from-QName($qname),fn:local-name-from-QName($qname)))"/>
            </xsl:when>
            <xsl:when test="substring($namespaceURI, string-length($namespaceURI), 1) = '/'">
                <xsl:sequence select="xs:anyURI(fn:concat(fn:namespace-uri-from-QName($qname),fn:local-name-from-QName($qname)))"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- warning -->
                <xsl:message>WARNING: The namespace definition <xsl:value-of select="fn:prefix-from-QName($qname)"/>: '<xsl:value-of select="$namespaceURI"/>' does not end with a fragment
                    identifier (hash '#' , or slash '/'). Please check namespace.xml and config-parameters.xsl.</xsl:message>
                <xsl:sequence select="xs:anyURI(fn:concat(fn:namespace-uri-from-QName($qname),'/',fn:local-name-from-QName($qname)))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>
