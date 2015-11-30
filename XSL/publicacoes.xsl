<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
<xsl:param name="idCurriculo"/>

	<xsl:template match="/">
		<html>
			<body>

				<!--CURRICULO COMPLETO-->
				<!--Seleciona apenas o curriculo com id igual ao selecionado no hiperlink-->
				<xsl:for-each select="cvLattes/curriculo[@id=$idCurriculo]">
					<!-- Título da página -->
					<title>Curriculo Lattes - <xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/> </title>

					<!-- Topo do curriculo -->
					<img>
	                    <xsl:attribute name="src">
	                        <xsl:value-of select="pessoal/arquivoFoto" />
	                    </xsl:attribute>
	                </img>

	                <table>
	                	<tr><td>  <h1><xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/></h1> </td></tr>
	                	<tr class="info"><td> Última atualização em: <xsl:value-of select="@ultimaAtualizacao" /> </td></tr>
	                </table>
	                <br />
					<br />
					<br />

					<hr />

					<!--1)BIOGRAFIA CURTA-->
					<table class="bio">
		      			<tr>
		      				<td><xsl:value-of select="pessoal/biografia_curta"/></td>
		      			</tr>
	      			</table>
	      			<br />

	      			<hr />

					<!--1)DADOS PESSOAIS-->
					<h2>Identificação</h2>
					<table class="seccao">
						<!-- Nome -->
		      			<tr class="info">
		      				<td class="campo">Nome:</td>
		      				<td><xsl:value-of select="pessoal/nome/primeiroNome"/>&#160;<xsl:value-of select="pessoal/nome/sobrenome"/></td>
		      			</tr>
		      			<tr class="info">
		      				<td class="campo">Citado como:</td>
		      				<td><xsl:value-of select="pessoal/nome/nomeEmCitacoes"/></td>
		      			</tr>
	      			</table>
	      			<br />

	      			<hr />

	      			<!-- ENDEREÇO -->
	      			<h2>Endereço</h2>
	      			<table class="seccao">
		      			<!-- Rua -->
		      			<tr class="info">
		      				<td class="campo">Endereço:</td>
		      				<td><xsl:value-of select="pessoal/endereco/rua"/>,&#160;
		      					<xsl:value-of select="pessoal/endereco/numero"/>,&#160;
		      					<xsl:value-of select="pessoal/endereco/bairro"/>.&#160;
		      					<xsl:if test="pessoal/endereco/complemento!= null"> 
		      						<xsl:value-of select="pessoal/endereco/complemento"/>.
		      					</xsl:if>
		      				</td>
		      			</tr>
		      			<tr class="info">
		      				<td class="campo">CEP:</td>
		      				<td><xsl:value-of select="pessoal/endereco/cep"/>-
		      					<xsl:value-of select="pessoal/endereco/cidade"/>-
		      					<xsl:value-of select="pessoal/endereco/estado"/>-
		      					<xsl:value-of select="pessoal/endereco/pais"/>.
		      				</td>
		      			</tr>
	      			</table>
	      			<br />

	      			<hr />
	      		
	      			<!--3)PUBLICAÇÕES-->
		      		<h2>Publicações</h2>
		      		<!-- Artigos completos publicados em periódicos  -->
		      		<xsl:if test="publicacoes/artigosCompletosPublicadosEmPeriodicos!= 0">
		      			<h3>Artigos completos publicados em periódicos</h3>
		      			<table class="seccao" >
			      			<xsl:for-each select="publicacoes/artigosCompletosPublicadosEmPeriodicos">
			      				<tr class="info">
			      					<td><xsl:value-of select="autores"/>.&#160;<xsl:value-of select="titulo"/>.&#160;<xsl:value-of select="periodico"/>.&#160;<xsl:value-of select="pagina"/>.&#160;<xsl:value-of select="ano"/></td>
			      				</tr>
			      			</xsl:for-each>
		      			</table>
	      				<br />
	      			</xsl:if>

	      			<!-- Livros  -->
	      			<xsl:if test="publicacoes/livrosPublicados!= 0">
		      			<h3>Livros </h3>
		      			<table class="seccao">
			      			<xsl:for-each select="publicacoes/livrosPublicados">
			      				<tr class="info">
			      					<td><xsl:value-of select="autores"/>.&#160;<xsl:value-of select="titulo"/>.&#160;<xsl:value-of select="cidade"/>.&#160;<xsl:value-of select="editora"/>.&#160;<xsl:value-of select="ano"/></td>
			      				</tr>
			      			</xsl:for-each>
		      			</table>
		      			<br />
		      		</xsl:if>

	      		</xsl:for-each>

			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
