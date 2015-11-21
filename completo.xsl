<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<xsl:for-each select="cvLattes/pessoal">
		      			<tr bgcolor="#9acd32">
		      				<td><xsl:value-of select="primeiroNome"/></td>
		      			</tr>
		      		</xsl:for-each>
	      		</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
