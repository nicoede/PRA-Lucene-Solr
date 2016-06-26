Acadêmicos:

Christopher Renkavieski

Edenilson Jonatas dos Passos

solr start //inicia o server standalone do Solr

solr create -c pra //cria o core

entrar no servidor local do solr

o windows não tem suporte para a ferramenta bin/post por isso foi necessário instalar uma ferramenta alternativa
disponibilizada pelo apache chamada SimplePostTool, obtida por:

java -jar example/exampledocs/post.jar -h

Para poder indexar os arquivos foi utilizado do comando 

java -Dauto -Dc=pra -Dfiletypes=html -jar C:\Users\edeni\Downloads\Compressed\solr-6.1.0\solr-6.1.0\pag\post.jar C:\Users\edeni\Downloads\Compressed\solr-6.1.0\solr-6.1.0\pag

-Dc=pra -> core de destino

Como teste foram adicionadas apenas 4 páginas no index com cada index com cerca de 1kb de tamanho as páginas inseridas foram: 
(isso depois do tratamento do primeiro algoritmo, o de download de páginas)
forro-dos-40---especial-dia-dos-namorados__63659.html
o-2016-registration-july-1st-july-4th-registration-15641726826affehomecard.html
www.eventbrite.com.br.html
www.sympla.com.br.html

Um exemplo de pesquisa foi:
Qual palavra tu desejas procurar?
evento

Encontrado(s) 3 iten(s) os sites que contém tais itens são:

https://www.sympla.com.br/forro-dos-40---especial-dia-dos-namorados__63659/

https://www.eventbrite.com.br
