#encoding: utf-8
require 'cmess/guess_encoding'

class PlantaController < ApplicationController
  before_filter :someonesigned!
  before_filter :finduser 
  # GET /planta
  # GET /planta.json
  def index
    @planta = Plantum.order(:nombre)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planta }
      format.csv { send_data @planta.to_csv }
      format.xls { send_data @planta.to_csv(col_sep: "\t")}      
    end
  end

  # GET /planta/1
  # GET /planta/1.json
  def show
    @plantum = Plantum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plantum }
    end
  end

  # GET /planta/new
  # GET /planta/new.json
  def new
    @plantum = Plantum.new
    if params[:agrupacion_id]
      @plantum.agrupacion_id=params[:agrupacion_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plantum }
    end
  end

  # GET /planta/1/edit
  def edit
    @plantum = Plantum.find(params[:id])
  end

  # POST /planta
  # POST /planta.json
  def create
    @plantum = Plantum.new(params[:plantum])

    respond_to do |format|
      if @plantum.save
        format.html { redirect_to @plantum, notice: 'Plantum was successfully created.' }
        format.json { render json: @plantum, status: :created, location: @plantum }
      else
        format.html { render action: "new" }
        format.json { render json: @plantum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planta/1
  # PUT /planta/1.json
  def update
    @plantum = Plantum.find(params[:id])

    respond_to do |format|
      if @plantum.update_attributes(params[:plantum])
        format.html { redirect_to @plantum, notice: 'Plantum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plantum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planta/1
  # DELETE /planta/1.json
  def destroy
    @plantum = Plantum.find(params[:id])
    @huerto=@plantum.huerto
    @plantum.destroy

    respond_to do |format|
      format.html { redirect_to huerto_url(@huerto) }
      format.json { head :no_content }
    end
  end
  
  def new_from_file
    
    @planta = Plantum.new
    if params[:agrupacion_id]
      @planta.agrupacion_id=params[:agrupacion_id]
    end    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planta }
      format.xml { render xml: @planta }
    end
  end

  def create_from_file
    @huerto=params[:plantum][:agrupacion_id]
    puts 'HUERTO'
    puts @huerto
    savefile_plantas(params[:upload])
    error=false
    #begin
      csv=readfile_plantas(params[:upload])
      puts '++++ end read file plantas'
      leidos=0
      csv.each do |row|
        leidos = leidos + 1
      end  
      crear_plantas_from_file(csv, params, @huerto)
      puts '++++ end crear personas'
    #rescue ArgumentError
    #  error=true
    #end    
    
    
    respond_to do |format|
      if error== false
        format.html { redirect_to url_for(:action=>:index) , :notice =>"Se han generado " + leidos.to_s + " Plantas" }
      else
        format.html { redirect_to url_for(:action=>:new_from_file) , :alert => true, :notice => "No se ha podido procesar el archivo debido un error de codificación de carácteres del archivo" }
      end
    end
  end  
  
  def savefile_plantas(upload)
    name =  upload['datafile'].original_filename
    directory = "#{Rails.root}/tmp"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  def readfile_plantas(upload)
    name =  upload['datafile'].original_filename
    directory = "#{Rails.root}/tmp"
    path = File.join(directory, name)
    content = File.read(path)
    charset = CMess::GuessEncoding::Automatic.guess(content)
    if charset == 'MACINTOSH'
      charset=':MacRoman'
    else
      charset= ':' + charset
    end
    lectura = 'r' + charset + ':utf-8'
    
    puts '+++++++ charset ' + charset 
    csv=CSV.parse(File.open(path, lectura){|f| f.read}, col_sep: ';', headers: true)
    csv
    
  end  
  
  def crear_plantas_from_file(csv, params, huerto)

# "name", "codigonx" , "direccion", "municipio", "provincia", "comunidad", "codigopostal", "potenciacil"
# "productor" , "x", "y", "icono", "descripcion", "aniomarcha", "foto01", "foto02", "foto03"
# "limiteproduccion", "limiteclientes", "cups"

    leidos=0
    csv.each do |row|
      leidos = leidos + 1
      record = Plantum.new(
          :agrupacion_id  => huerto, 
          :nombre => row[1],
          :razonsocial => row[2],
          :cif => row[3],         
          :cups => row[4],
          :potencia => row[5],                                    
          :produccion=> row[6],              
      )            
      record.save           
    end
  end    
  
end
