<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:xmi="http://www.omg.org/spec/XMI/20131001"
                xmlns:f="http://https://github.com/costezki/model2owl#"
                version="2.0"
                exclude-result-prefixes="impl">
   <xsl:import href="file:../../src/html-conventions-lib/enumeration-html-conventions.xsl"/>
   <xsl:import href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:include href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/common/xspec-utils.xsl"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:variable name="x:xspec-uri" as="xs:anyURI">file:/home/dragos/src/model2owl/test/unitTests/test-enumeration-html-conventions.xspec</xsl:variable>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/home/dragos/Oxygen%20XML%20Editor%2022/frameworks/xspec/src/reporter/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="file:../../src/html-conventions-lib/enumeration-html-conventions.xsl"
                   date="{current-dateTime()}"
                   xspec="file:/home/dragos/src/model2owl/test/unitTests/test-enumeration-html-conventions.xspec">
            <xsl:call-template name="x:d6e2"/>
            <xsl:call-template name="x:d6e7"/>
            <xsl:call-template name="x:d6e12"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d6e2">
      <xsl:message>Scenario for testing template with match 'element[@xmi:type = 'uml:Enumeration']-finding enumeration with unmet conventions</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing template with match 'element[@xmi:type = 'uml:Enumeration']-finding enumeration with unmet conventions</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/dragos/src/model2owl/test/testData/ePO-CM-v2.0.1-2020-03-27_test.eap.xmi</xsl:attribute>
            <xsl:attribute name="select">/xmi:XMI/xmi:Extension[1]/elements[1]/element[158]</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc-uri" as="xs:anyURI">file:/home/dragos/src/model2owl/test/testData/ePO-CM-v2.0.1-2020-03-27_test.eap.xmi</xsl:variable>
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc($impl:context-doc-uri)"/>
            <xsl:variable name="impl:context" as="item()*">
               <xsl:for-each select="$impl:context-doc">
                  <xsl:sequence select="/xmi:XMI/xmi:Extension[1]/elements[1]/element[158]"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e4">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:d6e5">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:d6e6">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e4">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>there is an Description List element</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(/dl)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(/dl)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>there is an Description List element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">boolean(/dl)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e5">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>there is an Description Term element</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(dl/dt)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(dl/dt)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>there is an Description Term element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">boolean(dl/dt)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e6">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>there is an Description Details element</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(dl/dd)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(dl/dd)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>there is an Description Details element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">boolean(dl/dd)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e7">
      <xsl:message>Scenario for testing template with match 'element[@xmi:type = 'uml:Enumeration']-finding enumeration with met conventions</xsl:message>
      <x:scenario>
         <x:label>Scenario for testing template with match 'element[@xmi:type = 'uml:Enumeration']-finding enumeration with met conventions</x:label>
         <x:context>
            <xsl:attribute name="href">file:/home/dragos/src/model2owl/test/testData/ePO-CM-v2.0.1-2020-03-27_test.eap.xmi</xsl:attribute>
            <xsl:attribute name="select">/xmi:XMI/xmi:Extension[1]/elements[1]/element[159]</xsl:attribute>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc-uri" as="xs:anyURI">file:/home/dragos/src/model2owl/test/testData/ePO-CM-v2.0.1-2020-03-27_test.eap.xmi</xsl:variable>
            <xsl:variable name="impl:context-doc"
                          as="document-node()"
                          select="doc($impl:context-doc-uri)"/>
            <xsl:variable name="impl:context" as="item()*">
               <xsl:for-each select="$impl:context-doc">
                  <xsl:sequence select="/xmi:XMI/xmi:Extension[1]/elements[1]/element[159]"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e9">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:d6e10">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:d6e11">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e9">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>there is an Description List element</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(/dl)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(/dl)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>there is an Description List element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">boolean(/dl)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e10">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>there is an Description Term element</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="boolean(dl/dt)" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="boolean(dl/dt)" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>there is an Description Term element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">boolean(dl/dt)</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e11">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>there is an Description Details element</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="exists($x:result)                 and test:wrappable-sequence($x:result)">
               <xsl:sequence select="test:wrap-nodes($x:result)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="not(boolean(dl/dd))" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="not(boolean(dl/dd))" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then boolean($impl:test-result)                     else test:deep-equal($impl:expected, $impl:test-result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>there is an Description Details element</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-sequence">
               <xsl:with-param name="sequence" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?">
               <xsl:attribute name="test">not(boolean(dl/dd))</xsl:attribute>
            </xsl:with-param>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d6e12">
      <xsl:message>Scenario for getting the enumeration name</xsl:message>
      <x:scenario>
         <x:label>Scenario for getting the enumeration name</x:label>
         <x:call>
            <xsl:attribute name="template">getenumerationName</xsl:attribute>
            <x:param>
               <xsl:attribute name="name">enumeration</xsl:attribute>
               <xsl:attribute name="href">file:/home/dragos/src/model2owl/test/testData/ePO-CM-v2.0.1-2020-03-27_test.eap.xmi</xsl:attribute>
               <xsl:attribute name="select">/xmi:XMI/xmi:Extension[1]/elements[1]/element[159]</xsl:attribute>
            </x:param>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="enumeration-doc-uri" as="xs:anyURI">file:/home/dragos/src/model2owl/test/testData/ePO-CM-v2.0.1-2020-03-27_test.eap.xmi</xsl:variable>
            <xsl:variable name="enumeration-doc"
                          as="document-node()"
                          select="doc($enumeration-doc-uri)"/>
            <xsl:variable name="enumeration" as="item()*">
               <xsl:for-each select="$enumeration-doc">
                  <xsl:sequence select="/xmi:XMI/xmi:Extension[1]/elements[1]/element[159]"/>
               </xsl:for-each>
            </xsl:variable>
            <xsl:call-template name="getenumerationName">
               <xsl:with-param name="enumeration" select="$enumeration"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$x:result"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:result</xsl:with-param>
         </xsl:call-template>
         <xsl:call-template name="x:d6e15">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d6e15">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>correct enumeration name</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>test:authorityType</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" as="item()*">
         <xsl:for-each select="$impl:expected-doc">
            <xsl:sequence select="node()"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, '')"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>correct enumeration name</x:label>
         <xsl:call-template name="test:report-sequence">
            <xsl:with-param name="sequence" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" as="xs:string">x:expect</xsl:with-param>
            <xsl:with-param name="test" as="attribute(test)?"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>