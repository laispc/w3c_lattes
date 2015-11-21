<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

	<xsl:template match="/">
		<html>
			<body>

				<!-- Título da página -->
				<title>Curriculo Lattes - <xsl:value-of select="cvLattes/curriculo[@id='1']/pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="cvLattes/curriculo[@id='1']/pessoal/nome/sobrenome"/> </title>

				<!--CURRICULO COMPLETO-->
				<xsl:for-each select="cvLattes/curriculo">

					<!--1)BIOGRAFIA CURTA-->
					Biografia curta
					<table border="1">
		      			<tr>
		      				<td><xsl:value-of select="pessoal/biografia_curta"/></td>
		      			</tr>
	      			</table>
	      			<br />

					<!--1)DADOS PESSOAIS-->
					Identificação
					<table border="1">
						<!-- Nome -->
		      			<tr bgcolor="#9acd32">
		      				<td>Nome:</td>
		      				<td><xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/></td>
		      				<td>Citado como:</td>
		      				<td><xsl:value-of select="pessoal/nome/nomeEmCitacoes"/></td>
		      			</tr>
	      			</table>
	      			<br />

	      			<!-- ENDEREÇO -->
	      			Endereço
	      			<table border="1" >
		      			<!-- Rua -->
		      			<tr bgcolor="#9adc32">
		      				<td>Rua:</td>
		      				<td><xsl:value-of select="pessoal/endereco/rua"/></td>
		      			</tr>
	      			</table>
	      		</xsl:for-each>

	      		<!--2)FORMAÇÃO-->
	      		<!--3)PUBLICAÇÕES-->
	      		<!--4)ORIENTAÇÕES-->
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
