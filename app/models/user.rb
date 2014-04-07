class User < ActiveRecord::Base
  
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  
  def get_usernexus
        @usuario_yelou = self.id
        @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
        peticion = @url + URI.escape('/ClienteWebSAN/Get/' + @usuario_yelou)
        puts peticion
        response = RestClient.get peticion
        puts response
        @usuario_nexus=response
  end
  
  
  def get_contratosnexus
        @usuario_yelou = self.id
        #@usuario_san = JSON.parse(@usuario_nexus)["idClienteSAN"]
        @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
        #peticion = @url + 'Contrato/BuscaPorIdClienteSAN/' + @usuario_san.to_s
        peticion = @url + URI.escape("/contrato/buscaporidclienteweb/#{@usuario_yelou}")
        puts peticion
        begin
        response = RestClient.get peticion
        rescue => e
          e.response
          return {}
        end
        #puts JSON.parse(response)
        #puts response
        #test =JSON.parse(response)
        #puts test[0]["suministro_cups"]
        
        if response.code == 200
          return JSON.parse(response)
        else
          return {}
        end
  end
  
end
