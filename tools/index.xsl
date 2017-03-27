<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
	xmlns:doc="http://www.xqdoc.org/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	exclude-result-prefixes="xs doc fn" version="2.0">
	<!-- Standalone xqdoc:xqdoc transform -->
	

	<xsl:variable name="css" select="'../resources/base.css'" />
	
	<!-- generate module html // -->
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<meta http-equiv="Generator"
					content="xquerydoc - https://github.com/xquery/xquerydoc" />

				<title>
					
					- Index
				</title>
				<style type="text/css">
					<xsl:value-of select="unparsed-text('../resources/page.css','UTF-8')" />
				</style>

				<style type="text/css">
					<xsl:value-of select="unparsed-text('../resources/query.css','UTF-8')" />
				</style>

				<link rel="stylesheet" type="text/css" href="{$css}" />
	
			</head>
			<body class="home" id="top">
				<div id="main">
					TODO
					</div>
			</body>
		</html>
	</xsl:template>

	

	<xsl:template name="toc">
		<nav id="toc">
			<div>
				<a href="..">&#8624;</a>
				what
			</div>
			<h2>
				<a id="contents"></a>
				Table of Contents
			</h2>
			<ol class="toc">
				<li>
					<a href="#main">
						<span class="secno">1 </span>
						<span class="content">Introduction</span>
					</a>
				</li>
				<li>
					<ol class="toc">
						<li>
							<a href="#variables">
								<span class="secno">2 </span>
								<span class="content">Variables</span>
							</a>
							<ol class="toc">
								
							</ol>
						</li>
					</ol>
				</li>
				<li>
					<ol class="toc">
						<li>
							<a href="#functions">
								<span class="secno">3 </span>
								<span class="content">Functions</span>
							</a>
							<ol class="toc">
								
							</ol>
						</li>
					</ol>

				</li>
				<li>
					<a href="#namespaces">
						<span class="secno">4 </span>
						<span class="content">Namespaces</span>
					</a>
				</li>
			</ol>
		</nav>
	</xsl:template>
</xsl:stylesheet>
