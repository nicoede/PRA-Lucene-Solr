require 'nokogiri'
require 'open-uri'
require 'net/https'
require 'open_uri_redirections'
print "Qual a palavra que tu desejas procurar?"
print "\n"
text = gets

def count_em(string, substring) #função pra acontar quantas vezes uma string aparece dentro de outra string
  string.scan(/(?=#{substring})/).count
end

#busca
open("resultados.txt", "wb") do |file|#salva o conteúdo da busca em um arquivo
  open("http://localhost:8983/solr/gettingstarted/select?defType=dismax&q="+text+"&fl=og_url") do |uri| #realiza a busca através do DisMax
     file.write(uri.read)
	 file.write"\n"
  end
  file.write"\n"
end

file = File.open("resultados.txt", "r+")
contents = file.read #passa o resultado da busca pra um vetor

count = count_em(contents, "og_url") #conta quantas url's a busca retornou
numero = contents.index('numFound=') #pega o indice do campo que tem o numero de itens encontrados no indice
itensEncontrados = contents[numero+10] #pega o indice exato da quantidade de itens encontrados no indice
numeric = itensEncontrados.to_i #era string precisa ser int, logo é feita a conversão

#teste caso não encontre nada
if numeric > 0
	print "\nEncontrado(s) "+itensEncontrados+" iten(s)"
else
	print "Não encontrado"
end

total = contents.length #pega o tamanho total do conteudo do resultado

a = 0

print " os sites que contém tais itens são:\n"
while a < (count-1) do # while de acordo com quantas url tem no resultado da busca, -1 pois há sempre um campo vazio
	numero = contents.index('https') # pega o indice do primeiro site
	i = numero
	print "\n"
	j = 0
	site = String.new

	while contents[i] != '<'  do
	   site[j] = contents[i]
	   i = i+1
	   j = j+1
	end
	
	a = a+1
	contents = contents[numero+1...total] # arruma o indice da string para pegar os próximos sites, caso contrário sempre pegaria o mesmo site
	print site
	print "\n"
end
print "\n"
