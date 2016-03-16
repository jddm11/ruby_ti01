require 'digest'
require 'net/http'
require 'open-uri'

class TallerController < ApplicationController
  
  def validarFirma
  	#.blank
  	if !params[:hash].nil? and !params[:mensaje].nil? then
		hash = params[:hash]
		data = params[:mensaje]
		result = Digest::SHA256.hexdigest data

		if(result.upcase  == hash.upcase ) then 
			render json: { "mensaje" => data, "valido" => true }
		else 
			render json: { "mensaje" => data, "valido" => false }
		end
	else
		render status: 400, json: { "mensaje" => 'Parametros erroneos', "valido" => false }
	end
  end

   def status
	return head(201)
   end

   def texto
   	   #result = open('https://s3.amazonaws.com/files.principal/texto.txt').read
	   #result = Nokogiri::HTML(resultAux)
       #result = Net::HTTP.get_response(URI.parse('https://s3.amazonaws.com/files.principal/texto.txt'))
       result = Net::HTTP.get(URI.parse('https://s3.amazonaws.com/files.principal/texto.txt'))
       hash   = Digest::SHA256.hexdigest result
       render text: { "hash" => hash, "text" => result}
   end
end
