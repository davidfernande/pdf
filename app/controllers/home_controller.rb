class HomeController < ApplicationController
  #before_filter :someonesigned!
  #before_filter :finduser
  
  def generate_pdf
    #adjust the pdftk path to suit your pdftk installation (Mirar en Heroku)        
    pdftk = PdfForms.new(ENV['PDFTK_PATH'] || "#{Rails.root}/pdf/vendor/pdftk/bin/pdftk.exe")     
           
    #pdftk.get_field_names("#{Rails.root}/public/Test.pdf")
        
    pdftk.fill_form "#{Rails.root}/public/Test.pdf", "#{Rails.root}/pdf/contratos/MyformWindows.pdf", :campo1 => 'Tambien Funciona', :campo2 => '77321804Z' 
    
    redirect_to home_path
    
    #UBUNTU Y CODIFICANDO EN XFDF
    #pdftk = PdfForms::XFdf.new('/usr/local/bin/pdftk')
    #@fields = pdftk.get_field_names('C:\Test.pdf') 
    #pdftk.fill_form 'C:\Test.pdf', 'myform.pdf', @fields.campo1 => 'Esto funciona...'
  end
  
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
