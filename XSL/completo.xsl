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

	      			<!--2)FORMAÇÃO-->
		      		<h2>Formação</h2>
		      		<table class="seccao">
		      			<xsl:for-each select="formacoes/formacao">
		      				<tr>
			      				<td class="campo"> 		      					
			      					<xsl:value-of select="inicio"/> - <xsl:value-of select="conclusao"/>
			      				</td>
			      				<td>
				      				<tr class="info"> 		      					
				      					<xsl:value-of select="titulo"/>
				      				</tr>
				      				<tr class="info"> 		      					
				      					<xsl:value-of select="instituicao"/>
				      				</tr>
				      				<tr class="info"> 		      					
				      					Orientador: &#160; <xsl:value-of select="orientador"/>
				      				</tr>
				      				<tr class="info"> 		      					
				      					Título: &#160; <xsl:value-of select="tema"/>
				      				</tr>
			      				</td>
		      				</tr>
		      				<br />
		      			</xsl:for-each>
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
	      			<hr />

		      		<!--4)ORIENTAÇÕES-->
		      		<h2>Orientações</h2>

		      		<h3>Orientações em Andamento</h3>
	      			<table class="seccao">
		      			<!-- Em Andamento -->
		      			<xsl:if test="count(orientacoes/orientacaoAnd[@tipo='IC'])!= 0"> 
			      			<h3>Iniciação Científica</h3>
			      			<!-- Busca todos as orientações em andamento de IC -->
				      		<xsl:for-each select="orientacoes/orientacaoAnd[@tipo='IC']">
				      			<tr class="campo">
				      				<td class="info"><xsl:value-of select="orientando"/>.
				      				<xsl:value-of select="titulo"/>.
				      				<xsl:value-of select="instituicao"/>.
				      				Inicio: <xsl:value-of select="inicio"/>.</td>
				      			</tr>
				      		</xsl:for-each>
				      	</xsl:if>
			      		<xsl:if test="count(orientacoes/orientacaoAnd[@tipo='MESTRADO'])!= 0"> 
				      		<h3>Mestrado</h3>
				      		<!-- Busca todos as orientações em andamento de Mestrado -->
				      		<xsl:for-each select="orientacoes/orientacaoAnd[@tipo='MESTRADO']">
				      			<tr class="campo">
				      				<td class="info"><xsl:value-of select="orientando"/>.
				      				<xsl:value-of select="titulo"/>.
				      				<xsl:value-of select="instituicao"/>.
				      				Inicio: <xsl:value-of select="inicio"/>.</td>
				      			</tr>
				      		</xsl:for-each>
				      	</xsl:if>
			      		<xsl:if test="count(orientacoes/orientacaoAnd[@tipo='DOUTORADO'])!= 0"> 
				      		<h3>Doutorado</h3>
				      		<!-- Busca todos as orientações em andamento de Doutorado -->
				      		<xsl:for-each select="orientacoes/orientacaoAnd[@tipo='DOUTORADO']">
				      			<tr class="campo">
				      				<td class="info"><xsl:value-of select="orientando"/>.
				      				<xsl:value-of select="titulo"/>.
				      				<xsl:value-of select="instituicao"/>.
				      				Inicio: <xsl:value-of select="inicio"/>.</td>
				      			</tr>
				      		</xsl:for-each>
			      		</xsl:if>
	      			</table>
	      			<br/>
	      			<h3>Orientações Concluídas</h3>
	      			<table class="seccao">
		      			<!-- Concluida -->
		      			<xsl:if test="count(orientacoes/orientacaoCon[@tipo='IC'])!= 0"> 
			      			<h3>Iniciação Científica</h3>
			      			<!-- Busca todos as orientações concluídas de IC -->
				      		<xsl:for-each select="orientacoes/orientacaoCon[@tipo='IC']">
				      			<tr class="campo">
				      				<td class="info"><xsl:value-of select="orientando"/>.
				      				<xsl:value-of select="titulo"/>.
				      				<xsl:value-of select="instituicao"/>.
				      				<xsl:value-of select="fim"/>.</td>
				      			</tr>
				      		</xsl:for-each>
				      	</xsl:if>
				      	<xsl:if test="count(orientacoes/orientacaoCon[@tipo='MESTRADO'])!= 0"> 
				      		<h3>Mestrado</h3>
			      			<!-- Busca todos as orientações concluídas de Mestrado -->
				      		<xsl:for-each select="orientacoes/orientacaoCon[@tipo='MESTRADO']">
				      			<tr class="campo">
				      				<td class="info"><xsl:value-of select="orientando"/>.
				      				<xsl:value-of select="titulo"/>.
				      				<xsl:value-of select="instituicao"/>.
				      				<xsl:value-of select="fim"/>.</td>
				      			</tr>
				      		</xsl:for-each>
				      	</xsl:if>
				      	<xsl:if test="count(orientacoes/orientacaoCon[@tipo='DOUTORADO'])!= 0"> 
				      		<h3>Doutorado</h3>
			      			<!-- Busca todos as orientações concluídas de Doutorado -->
				      		<xsl:for-each select="orientacoes/orientacaoCon[@tipo='DOUTORADO']">
				      			<tr class="campo">
				      				<td class="info"><xsl:value-of select="orientando"/>.
				      				<xsl:value-of select="titulo"/>.
				      				<xsl:value-of select="instituicao"/>.
				      				<xsl:value-of select="fim"/>.</td>
				      			</tr>
				      		</xsl:for-each>
				      	</xsl:if>
	      			</table>
	      			<hr />

	      			<h2>Citações</h2>
	      			<!--CITACOES-->
	      			<table border="0">
	      			<xsl:for-each select="citacoes">
		      			<tr>
		      				<td class="info"><xsl:for-each select="autores/autor"> 
		      					<xsl:choose>
   								<xsl:when test="@tipo = 'este'">
   									<b><xsl:value-of select="."/>; </b>
   								</xsl:when>
								<xsl:otherwise>
   									<xsl:value-of select="."/>;
   								</xsl:otherwise>
   							</xsl:choose>
		      				</xsl:for-each>
		      				<xsl:value-of select="titulo"/>.
		      				<xsl:value-of select="instituicao"/>,
		      				<xsl:value-of select="versao"/>,
		      				<xsl:value-of select="pagina"/>,
		      				<xsl:value-of select="ano"/>.
		      				</td>
		      			</tr>
			      	</xsl:for-each>
	      			</table>
	      		</xsl:for-each> <!-- FIM CURRÍCULO -->
	      		
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
