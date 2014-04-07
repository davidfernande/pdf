class PanelsController < ApplicationController
  before_filter :someonesigned!
  before_filter :finduser
  def index
    @contratos = Contrato.actualuser(@user.id, admin_signed_in?).find(:all)
    @precontratos = Precontrato.actualuser(@user.id, admin_signed_in?).find(:all)
    #@usuario_nexus = @user.get_usernexus
    @contratos_nexus = @user.get_contratosnexus 
    #@estado_contratos_nexus = @user.get_estado_contratosnexus 
    puts "cups llega panels"
    puts session[:cups]
    if params[:cups] and (not session[:cups])
      @huerto=params[:cups]
      session[:cups]= @huerto
      cookies[:cups]= @huerto
    end
    puts "cups sale panels"
    puts session[:cups]
    puts @huerto
    puts @contratos_nexus
    puts 'sumas'
    puts @contratos_nexus.size
    puts @precontratos.size
    
    #@users = User.all
    if @contratos_nexus.size==0 and @precontratos.size==0
      #no tiene contratos ni precontratos le envió a 
      redirect_to contratos_steps_path
    end
end



end
