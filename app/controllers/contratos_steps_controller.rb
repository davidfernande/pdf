class ContratosStepsController < ApplicationController
  include Wicked::Wizard
  steps :bienvenido, :documentosnecesarios, :cargadocumentos,  :cups, :cliente, :titular, :suministro, 
  :apoderado, :justotitulo, :cie, :primeraocupacion, :banco, :aceptaciones, :enviaranexus, :finalizado
  
  #:procesodocumentos, :datosdocumentos,
  
  before_filter :someonesigned!
  before_filter :finduser  
  
def get_provincias

        @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
        peticion = @url + URI.escape('/Localizacion/BuscaProvincias?provincia=' + params[:provincia])
        
        puts peticion
        begin
        response = RestClient.get peticion 
        #{:params => {:Provincia => params[:Provincia] }}
        puts response
        rescue => e
          e.response
          response = [""]
        else
               
        end
        render :json => response    
    
end    
  
def get_municipios

        @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
        peticion = @url + URI.escape('/Localizacion/BuscaMunicipiosPorProvincia?provincia=' + 
                              params[:provincia] + '&municipio=' + params[:municipio] )
        
        puts peticion
        begin
        response = RestClient.get peticion 
        
        #{:params => {:Provincia => params[:Provincia],:municipio => params[:municipio]}}
        
        puts response
        rescue => e
          e.response
          response = [""]
        else
               
        end
        render :json => response    
    
end  
  
def get_codigopostal

        @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
        peticion = @url + URI.escape('/Localizacion/BuscaCodigosPostalesPorProvinciaMunicipio?provincia=' +
                             params[:provincia] + '&municipio=' +
                             params[:municipio] + '&codigopostal=' + 
                             params[:codigopostal] )
        
        
        puts peticion
        begin
        response = RestClient.get peticion
        # {:params => {:Provincia => params[:Provincia],:municipio => params[:municipio],:codigopostal => params[:codigopostal]}}
        puts response
        rescue => e
          e.response
          response = [""]
        else
               
        end
        render :json => response    
    
end  
  
def cupscall
        
        @url = 'http://' + ENV["NEXUS_SERVER"] + ENV["NEXUS_BASE_URL"]
        peticion = @url + URI.escape('/SIPS/BuscaCUPS?cups=' + params[:fieldValue])
        puts peticion
        begin
        response = RestClient.get peticion
        rescue => e
          e.response
          @basura =["precontrato_suministro_cups", false]
        else
          #puts JSON.parse(response)
          #puts response
          #test =JSON.parse(response)
          #puts test[0]["suministro_cups"]
          
          if response.code == 409
            @basura =["precontrato_suministro_cups", false]
          end
          if response.code == 200
            @basura =["precontrato_suministro_cups", true]
          else       
            @basura =["precontrato_suministro_cups", false]
          end               
        end
        render :json => @basura.to_json     
end  
 
    
  def show
    
    if params[:agrupacion] or session[:agrupacion]
        if params[:agrupacion] 
          session[:agrupacion]= params[:agrupacion] 
        else
          # do nothing
        end
        @datoshuerto = buscahuerto(session[:agrupacion] ) 
    end
    
    
    if session[:precontrato_id]
        @precontrato=Precontrato.actualuser(@user.id, ( @user.has_role? :admin ) ).find_by_id(session[:precontrato_id])
        if @precontrato.huertoid
          session[:agrupacion]= @precontrato.huertoid #ojo con esto que cups no es cups
          @datoshuerto = buscahuerto(@precontrato.huertoid)
        else
          if session[:agrupacion]
               @precontrato.huertoid=session[:agrupacion]
               @datoshuerto = buscahuerto(@precontrato.huertoid)
          end 
        end
    end
    puts "precontrato: #{session[:precontrato_id]}" 
    puts "huerto: #{session[:cups]}"
 
   
  
   case step
      
   when :bienvenido
        
        #puts "cups"
        #puts session[:cups]
        
        
        #puts "cups"
        #puts @datoshuerto.codigonx
        
   when :continuar
     
   when :documentosnecesarios

   when :cups
      
   when :cargadocumentos  
        skip_step
        
        if session[:precontrato_id] == nil
          @precontrato=Precontrato.new()
          @precontrato.huertoid=session[:agrupacion]
          if (not @precontrato.owner_id)
            @precontrato.owner_id=@user.id
          end 
          @precontrato.save
          session[:precontrato_id]=@precontrato.id
          puts 'creado precontrato'
          puts @precontrato.id
        else
          puts 'precontrato'
          puts @precontrato.id
          session[:precontrato_id]=@precontrato.id                    
        end
        
   when :titular   

            skip_step

        
   when :suministro

            skip_step

        
   when :apoderado

            skip_step

        
   when :justotitulo
            skip_step
   when :cie

            skip_step
           
   when :primeraocupacion

            skip_step
        
   when :finalizado
        #enviar los datos a nexus y marcarlo como enviado
        if @precontrato.id != nil
          #@precontrato.finalizado = true
              
              contratos_nexus = @precontrato.post_precontratonexus(@user)
              if contratos_nexus==200
                  #todo bien le felicito y borro el precontrato
                  UserMailer.thanks_email(@user,@precontrato).deliver
                  @precontrato.delete
              else
                redirect_to '/error'
                #enviar a página de error
                  #ha habido un error
              end
          #@precontrato.update_attribute(:finalizado, true)
          
        end                  
   else
     
   end
   
   render_wizard
  end
  
  def edit
    @precontrato=Precontrato.actualuser(@user.id, ( @user.has_role? :admin ) ).find(params[:precontrato_id])
    puts 'precontrato'
    puts @precontrato.id.to_s
    session[:precontrato_id]=params[:precontrato_id]
    redirect_to '/contratos_steps/continuar'
  end
  
  def update
     if session[:precontrato_id] != nil
       @precontrato=Precontrato.actualuser(@user.id, ( @user.has_role? :admin ) ).find(session[:precontrato_id])
     end  
    @precontrato.update_attributes(params[:precontrato])
    #session[:precontrato_id]=@precontrato.id
    render_wizard @precontrato
  end
  
  def buscahuerto(agrupacion)
    #puts cups
    @huerto=Huerto.find_by_agrupacion(agrupacion)
    #puts @huerto.codigonx
  end
end
