/*Arquivo js com as funções utilizadas em "Lattes.html"*/

var xslStylesheet;
            var myDOM;
            var x;
            var idCurriculo;

            /*
            A função curriculo() altera o valor da variável "idCurriculo" para o valor
            da "id" do currículo selecionado na lista de currículos e chama a função completo().
            */
            function curriculo(id){
                reset();
                window.idCurriculo = id;
                completo();
            }

            /*
            A função completo() carrega a visão com todas as informações do currículo para visualização.
            */
            function completo(){
                reset();
                xmlDoc=document.implementation.createDocument("","",null);
				xslDoc=document.implementation.createDocument("","",null);
			    xmlDoc.async = false;
	            xslDoc.async = false;
				xmlDocName = "XML/info.xml";
				xmlDoc.load(xmlDocName);
				xslDoc.load("XSL/completo.xsl"); 

	            var xsltProcessor = new XSLTProcessor();
				xsltProcessor.importStylesheet(xslDoc);
                xsltProcessor.setParameter(null,"idCurriculo", idCurriculo);
				resultDocument = xsltProcessor.transformToFragment(xmlDoc,document);
				document.getElementById("view").appendChild(resultDocument);
            }
            /*
            A função orien() carrega a visão com apenas as informações pessoais e orientações
            do currículo para visualização.
            */
            function orien(){
                reset();
                xmlDoc=document.implementation.createDocument("","",null);
				xslDoc=document.implementation.createDocument("","",null);
				xmlDoc.async = false;
	            xslDoc.async = false;
				xmlDocName = "XML/info.xml";
				xmlDoc.load(xmlDocName);
				xslDoc.load("XSL/orientacao.xsl");
	           
	            var xsltProcessor = new XSLTProcessor();
				xsltProcessor.importStylesheet(xslDoc);
                xsltProcessor.setParameter(null,"idCurriculo", idCurriculo);
				resultDocument = xsltProcessor.transformToFragment(xmlDoc,document);
				document.getElementById("view").appendChild(resultDocument);
            }
            /*
            A função publi() carrega a visão com apenas as informações pessoais e publicações
            do currículo para visualização.
            */
            function publi(){
                reset();
                xmlDoc=document.implementation.createDocument("","",null);
				xslDoc=document.implementation.createDocument("","",null);
				xmlDoc.async = false;
				xslDoc.async = false;
				xmlDocName = "XML/info.xml";
				xmlDoc.load(xmlDocName);
				xslDoc.load("XSL/publicacoes.xsl");
				
	            var xsltProcessor = new XSLTProcessor();
				xsltProcessor.importStylesheet(xslDoc);
                xsltProcessor.setParameter(null,"idCurriculo", idCurriculo);
				resultDocument = xsltProcessor.transformToFragment(xmlDoc,document);
				document.getElementById("view").appendChild(resultDocument);
            }
            /*
            A função lista() lista o nome de todos os currículos existentes no xml
            para a visualização do usuário. 
            */
            function lista(){
                reset();
                xmlDoc=document.implementation.createDocument("","",null);
                xslDoc=document.implementation.createDocument("","",null);
                xmlDoc.async = false;
                xslDoc.async = false;
                xmlDocName = "XML/info.xml";
                xmlDoc.load(xmlDocName);
                xslDoc.load("XSL/lista.xsl");
                
                var xsltProcessor = new XSLTProcessor();
                xsltProcessor.importStylesheet(xslDoc);
                resultDocument = xsltProcessor.transformToFragment(xmlDoc,document);
                document.getElementById("view").appendChild(resultDocument);
            }


            function reset(){
               	while(document.getElementById("view").hasChildNodes())
               	{
               	    document.getElementById("view").removeChild(document.getElementById("view").lastChild);
               	}
            }
            
            window.onload = lista;