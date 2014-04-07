class HomeController < ApplicationController
  #before_filter :someonesigned!
  #before_filter :finduser
  
  def generate_pdf
    #adjust the pdftk path to suit your pdftk installation (Mirar en Heroku)
    #:data_format => 'XFdf'           PdfForms::XFdf.new
    
    pdftk = PdfForms.new(ENV['PDFTK_PATH'] || '/usr/local/bin/pdftk')
    #fdf = PdfForms.new::XFdf :campo1=>"Hola"
    #puts fdf.to_pdf_data
    #fdf.fill_form 'C:\Test.pdf', 'myform.pdf', @fields.campo1 => 'Esto funciona...',:data_format=>'XFdf'
    #fdf.save_to 'C:\file.pdf'
    
    #add :data_format => 'XFdf' option to generate XFDF instead of FDF when filling a form    
    @fields = pdftk.get_field_names("#{Rails.root}/public/Test.pdf")
    
    #puts "CAPTUTA LOS FIELDS_NAMES"
    pdftk.fill_form '#{Rails.root}/public/Test.pdf', '#{Rails.root}/public/Myform.pdf', @fields.campo1 => 'Funciona'
    
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
