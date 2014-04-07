class Precontrato < ActiveRecord::Base
attr_protected
before_validation :format_params

  scope :actualuser, lambda {|owner_id, es_admin| where("owner_id = '?'", owner_id)  unless es_admin }

#  def get_tarifa
#    @usuario_yelou = user.id
#    @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
#    peticion = @url + URI.escape('/Contrato/BuscaDesgloseCuotaFijaMensualPorPotenciaConsumoAlquiler?')
#    response = RestClient.get peticion, {:params => {:Potencia => 2.5, :ConsumoMensual=>280.4, :CosteMensualAlquilerContador => 1.88 }}
#    puts response
#  end

  
  def post_precontratonexus(user)
   #@usuario_nexus = @user.get_usernexus
   @usuario_yelou = self.owner_id
   @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
   peticion = @url + '/Contrato/Add'
   puts peticion
   
     @contrato_nexus = {
     :clienteye => @usuario_yelou.to_i,
     #:clientenx => nil,
     #:idcontratosan => nil,
     :suministro_cups => self.suministro_cups,
     :suministro_pago => "Prepago",
     :suministro_tarifa => self.suministro_tarifa,
     :datossuministro_potencia => self.datossuministro_potencia.to_f,
     :datossuministro_consumoestimado => self.datossuministro_consumoestimado.to_f,
     :costemensualalquilercontador => self.CosteMensualAlquilerContador.to_f,
     :cliente_nombre => self.cliente_nombre,
     :cliente_apellido1 => self.cliente_apellido1,
     :cliente_apellido2 => self.cliente_apellido2,
     :cliente_nifniecif => self.cliente_nifniecif,
     :cliente_domicilio => self.cliente_domicilio,
     :cliente_provincia => self.cliente_provincia,
     :cliente_municipio => self.cliente_municipio,
     :cliente_codigopostal => self.cliente_codigopostal,
     :cliente_email => self.cliente_email,
     :cliente_telefono => self.cliente_telefono,
     :cliente_telefonomovil => self.cliente_telefono_movil,
     :cliente_fax => self.cliente_fax,
     :titular_elmismo => true,
     :datossuministro_elmismo => true,
     :comunicaciones_elmismo => true,
     :cliente_apoderado => false,
     :esprimera_ocupacion => false,
     :suministro_cambio => false,    
     :aceptaciones_aceptoterminoscontratacion => true,
     :aceptaciones_aceptoterminosgenerales => true,
     :aceptaciones_aceptoefactura => true,
     :aceptaciones_aceptocontratoelectronico => true,
     :banco_nombre => self.banco_nombre,
     :banco_apellido1 => self.banco_apellido1,
     :banco_apellido2 => self.banco_apellido2,
     :banco_cuenta => self.banco_cuenta.gsub('-', ''),
     :banco_nif => self.banco_nif,
     :suministro_codigonx => obtenercodigonx(self.huertoid),   
     :datossuministro_direccion => self.cliente_domicilio,
     :datossuministro_provincia => self.cliente_provincia,
     :datossuministro_municipio => self.cliente_municipio,
     :datossuministro_codigopostal => self.cliente_codigopostal,
     :titular_nombre => self.cliente_nombre,
     :titular_apellido1 => self.cliente_apellido1,
     :titular_apellido2 => self.cliente_apellido2,
     :titular_nifniecif => self.cliente_nifniecif
     }
  
   puts @contrato_nexus.to_json
   begin
     response = RestClient.post peticion, @contrato_nexus.to_json, :content_type => :json, :accept => :json
   rescue => e
      puts e.response 
      return e.response
   end     
   puts response.code
   return response.code
  end  

def format_params
  #formatear y corregir antes de guardar
end  
  
def obtenercodigonx(agrupacion)
  @datoshuerto = Huerto.find_by_agrupacion(agrupacion)
  #ahora que tengo el huerto pillo el cups aleatoriamente del campo cupss
  # en un futuro habrá que tener en cuenta factores de ocupacion y carga de los huertos por cups
  
  #puts @datoshuerto.planta
  cuenta=@datoshuerto.planta.count
  elegido=rand(cuenta)
  puts @datoshuerto.planta[elegido].cups
  return @datoshuerto.planta[elegido].cups
  
  #list = @datoshuerto.cupss.split(" ") # => ["a", "b", "c"]
  #puts list.count
  #puts list[rand(list.count)] #ya agregaremos un random
  #return list[rand(list.count)] 
end  
  
  
end
