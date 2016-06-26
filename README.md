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
