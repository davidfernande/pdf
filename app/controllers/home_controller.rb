class HomeController < ApplicationController
  #before_filter :someonesigned!
  #before_filter :finduser
  
  def index
    #@users = User.all
    #@huerto=params[:cups]
    #session[:cups]= @huerto
    #cookies[:cups]= @huerto
    #puts "cups"
    #puts @huerto
    #puts 'decode'
    #puts Base64.decode64(@session.data)
    if params[:cups] or session[:cups]
        if params[:cups]
          session[:cups]= params[:cups] 
          cookies[:cups]= params[:cups]
          puts 'cups de home controller'
          puts session[:cups]          
        end
    end    
  end
end
