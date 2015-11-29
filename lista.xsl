<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

	<xsl:template match="/">
		<html>
			<body>
				<!--LISTA COM TODOS OS CURRICULOS-->
				<table border="0">
					<xsl:for-each select="cvLattes/curriculo">
						<tr>
							<!--CRIA UM HIPERLINK PARA CADA CURRICULO DO XML-->
							<td align="left"><a href="#" onclick="curriculo({./@id})" >
							<xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/></a></td>
						</tr>
					</xsl:for-each>
				</table> 
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
