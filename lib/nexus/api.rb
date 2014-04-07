# Encoding: UTF-8

#require 'prawn'
#require './lib/s3methods.rb'
#include S3Methods

#  NEXUS_SERVER='212.9.78.41'
#  NEXUS_BASE_URL= '/yelou/Api/ClienteWebSAN/'

module Nexus

  class InvalidRequest < Exception
  end

  class ServerError < Exception
  end
  
  class API
    def initialize()
        @usuario_yelou = @user.id
        @url = 'http:/' + NEXUS_SERVER + NEXUS_BASE_URL

    end
    def test
        response = RestClient.get @url +  'Get/' + @usuario.id
        puts response
    end
  
   
    def generate_certificate_pdf_SMS(templatename,us,emp,tem, emisor, entidad_emisor, destino, entidad_destino, text_message)  
    
    end
  end
end
