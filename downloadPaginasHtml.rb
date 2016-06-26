require 'nokogiri'
require 'open-uri'
require 'net/https'
require 'open_uri_redirections'

url = gets.chomp #pega o input (site) do usuário

tamanho = url.length #pega o tamanho total da url

fh = open(url, :allow_redirections => :safe, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) #condição pra abrir a página e permitir redirecionamentos
#pois algumas páginas são redirecionadas, o usuário pode digitar somente www.evenbrite.com.br, mas o navegador
#sabe que na verdade é https://www.eventbrite.com.br

html = fh.read

if tamanho == 24 # caso o usuário digite a página raiz
	fileHtml = File.new("www.sympla.com.br.html", "w+")
	fileHtml.puts html
	fileHtml.close()
	exit
end

if tamanho == 28 # caso o usuário digite a página raiz
	fileHtml = File.new("www.eventbrite.com.br.html", "w+")
	fileHtml.puts html
	fileHtml.close()
	exit
end

if url.include? "sympla" # se for uma sub página ele vai salvar somente ela .html por isso essa condição
	fileHtml = File.new(url[26..tamanho]+".html", "w+")
	fileHtml.puts html
	fileHtml.close()
	exit
end

if url.include? "eventbrite" # se for uma sub página ele vai salvar somente ela .html por isso essa condição
	newUrl = url.gsub(/[^a-zA-Z0-9\-]/,"") 
	fileHtml = File.new(newUrl[30..tamanho]+".html", "w+")
	fileHtml.puts html
	fileHtml.close()
end

