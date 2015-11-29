<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
<xsl:param name="idCurriculo"/>

	<xsl:template match="/">
		<html>
			<body>

				<!--CURRICULO ORIENTACOES-->
				<!--Seleciona apenas o curriculo com id igual ao selecionado no hiperlink-->
				<xsl:for-each select="cvLattes/curriculo[@id=$idCurriculo]">
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


		      		<!--ORIENTAÇÕES-->
		      		Orientações

	      			<table border="0">
		      			<!-- Em Andamento -->
		      			<tr> Orientações em Andamento</tr>
			      		<xsl:for-each select="orientacoes/orientacao[@status='emAndamento']">
			      			<tr>
			      				<td><xsl:value-of select="orientando"/>.
			      				<xsl:value-of select="titulo"/>.
			      				<xsl:value-of select="instituicao"/>.
			      				Inicio: <xsl:value-of select="inicio"/>.</td>
			      			</tr>
			      		</xsl:for-each>
	      			</table>
	      			<br/>
	      			<table border="0">
		      			<!-- Concluida -->
		      			<tr> Orientações Concluídas</tr>
			      		<xsl:for-each select="orientacoes/orientacao[@status='concluida']">
			      			<tr>
			      				<td><xsl:value-of select="orientando"/>.
			      				<xsl:value-of select="titulo"/>.
			      				<xsl:value-of select="instituicao"/>.
			      				<xsl:value-of select="fim"/>.</td>
			      			</tr>
			      		</xsl:for-each>
	      			</table>

	      		</xsl:for-each> <!-- FIM CURRÍCULO -->
	      		
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
