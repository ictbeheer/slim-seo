<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:html="http://www.w3.org/TR/REC-html40"
	xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
	xmlns:news="https://www.google.com/schemas/sitemap-news/0.9/"
	xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>XML Sitemap</title>
		<meta charset="utf-8" />
		<style>
			* {
				box-sizing: border-box;
			}
			body {
				font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
			    font-size: 14px;
			    line-height: 1.6;
			    color: #495057;
			    background: #f5f7fb;
			    margin: 0;
			    text-align: center;
			}
			main {
				margin: 45px auto;
				display: inline-block;
				text-align: left;
				max-width: 800px;
			}
			table {
				font-size: 14px;
			}
			h1 {
				text-align: center;
				line-height: 1.1;
				font-weight: 600;
			}
			.list {
				border: 1px solid rgba(0, 40, 100, .12);
				border-radius: 4px;
				background: #fff;
				box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);
			}
			a {
				text-decoration: none;
				color: #495057;
				transition: color .2s;
			}
			a:hover {
				color: #9aa0ac;
			}
			table {
				border-collapse: collapse;
			}
			tr:first-child {
			    border-bottom: 2px solid rgba(0, 40, 100, .12);
			    background: none;
			}
			tr:nth-child(2n) {
			    background: rgba(0, 0, 0, .03);
			}
			th,
			td {
			    padding: .6em 1em;
			    color: #9aa0ac;
			}
			th {
				text-align: left;
				font-size: 12px;
				font-weight: normal;
				text-transform: uppercase;
			}
			.info {
				margin-top: 15px;
				color: #9aa0ac;
			}
		</style>
	</head>
	<body>
	<main>
		<h1>XML Sitemap</h1>

		<xsl:if test="count(sitemap:sitemapindex/sitemap:sitemap) &gt; 0">
			<div class="list">
				<table width="100%">
					<tr>
						<th width="100%">Sitemap</th>
					</tr>
					<xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
						<xsl:variable name="sitemapURL">
							<xsl:value-of select="sitemap:loc"/>
						</xsl:variable>
						<tr>
							<td>
								<a href="{$sitemapURL}"><xsl:value-of select="sitemap:loc"/></a>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div class="info">
				This XML Sitemap Index file contains <xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"/> sitemaps. Generated by <a href="https://wpslimseo.com">Slim SEO</a>.
			</div>
		</xsl:if>

		<xsl:if test="count(sitemap:sitemapindex/sitemap:sitemap) &lt; 1">
			<div class="list">
				<table>
					<tr>
						<th width="75%">URL</th>
						<th width="25%">Last Modified</th>
					</tr>
					<xsl:for-each select="sitemap:urlset/sitemap:url">
						<tr>
							<td>
								<xsl:variable name="itemURL">
									<xsl:value-of select="sitemap:loc"/>
								</xsl:variable>
								<a href="{$itemURL}">
									<xsl:value-of select="sitemap:loc"/>
								</a>
							</td>
							<td>
								<xsl:value-of select="sitemap:lastmod"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div class="info">
				This XML Sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs. Generated by <a href="https://wpslimseo.com">Slim SEO</a>.
			</div>
		</xsl:if>
	</main>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>
