<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

	<xsl:template match="/">
		<html>
			<body>

				<!--CURRICULO COMPLETO-->
				<xsl:for-each select="cvLattes/curriculo[@id='1']">
					<!-- Título da página -->
					<title>Curriculo Lattes - <xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/> </title>

					<!-- Topo da curriculo -->
					<img>
	                    <xsl:attribute name="src">
	                        <xsl:value-of select="pessoal/arquivoFoto" />
	                    </xsl:attribute>
	                </img>
	                <h1><xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/></h1>
	                Ultima atualização em: <xsl:value-of select="@ultimaAtualizacao" />
	                <br />

					<br />
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
		      			</tr>
		      			<tr>
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
	      			<br />

	      			<!--2)FORMAÇÃO-->
		      		Formação
		      		<table border="1" >
		      			<xsl:for-each select="formacoes/formacao">
		      				<tr> 		      					
		      					<td><xsl:value-of select="inicio"/> - <xsl:value-of select="conclusao"/></td>
		      				</tr>
		      				<tr> 		      					
		      					<td><xsl:value-of select="titulo"/></td>
		      				</tr>
		      				<tr> 		      					
		      					<td><xsl:value-of select="instituicao"/></td>
		      				</tr>
		      				<tr> 		      					
		      					<td><xsl:value-of select="orientador"/></td>
		      				</tr>
		      				<tr> 		      					
		      					<td><xsl:value-of select="tema"/></td>
		      				</tr>

		      			</xsl:for-each>
		      		</table>
		      		<br />

		      		<table border="1" >
		      			<!-- Artigos completos publicados em periódicos  -->
		      			<xsl:for-each select="publicacoes/artigosCompletosPublicadosEmPeriodicos">
		      				<tr>
		      					<td><xsl:value-of select="autores"/></td>
		      				</tr>
		      			</xsl:for-each>
		      		</table>
		      		<br />

		      		<!--3)PUBLICAÇÕES-->
		      		Publicações
	      			- Artigos completos publicados em periódicos
	      			<table border="1" >
		      			<!-- Artigos completos publicados em periódicos  -->
		      			<xsl:for-each select="publicacoes/artigosCompletosPublicadosEmPeriodicos">
		      				<tr>
		      					<td><xsl:value-of select="autores"/></td>
		      				</tr>
		      			</xsl:for-each>
	      			</table>
	      			<br />
		      		<!--4)ORIENTAÇÕES-->
	      		</xsl:for-each> <!-- FIM CURRÍCULO -->
	      		
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
