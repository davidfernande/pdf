#encoding: utf-8
require 'cmess/guess_encoding'

class HuertosController < ApplicationController
  # GET /huertos
  # GET /huertos.json
  before_filter :someonesigned!, :except => [:huertopublico,:index]
  before_filter :finduser,  :except => [:huertopublico,:index]
  def index
    @huertos = Huerto.order(:agrupacion)

    respond_to do |format|
      format.html # index.html.erb
      format.json 
      format.csv { send_data @huertos.to_csv }
      format.xls { send_data @huertos.to_csv(col_sep: "\t")}
    end
  end

  # GET /huertos/1
  # GET /huertos/1.json
  def show
    @huerto = Huerto.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @huerto }
    end
  end
  
    # GET /huertos/1
  # GET /huertos/1.json
  def huertopublico
    @huerto = Huerto.find_by_agrupacion(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @huerto }
    end
  end

  # GET /huertos/new
  # GET /huertos/new.json
  def new
    @huerto = Huerto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @huerto }
    end
  end

  # GET /huertos/1/edit
  def edit
    @huerto = Huerto.find(params[:id])
  end

  # POST /huertos
  # POST /huertos.json
  def create
    @huerto = Huerto.new(params[:huerto])

    respond_to do |format|
      if @huerto.save
        format.html { redirect_to @huerto, notice: 'Huerto was successfully created.' }
        format.json { render json: @huerto, status: :created, location: @huerto }
      else
        format.html { render action: "new" }
        format.json { render json: @huerto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /huertos/1
  # PUT /huertos/1.json
  def update
    @huerto = Huerto.find(params[:id])

    respond_to do |format|
      if @huerto.update_attributes(params[:huerto])
        format.html { redirect_to @huerto, notice: 'Huerto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @huerto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /huertos/1
  # DELETE /huertos/1.json
  def destroy
    @huerto = Huerto.find(params[:id])
    @huerto.destroy

    respond_to do |format|
      format.html { redirect_to huertos_url }
      format.json { head :no_content }
    end
  end

  def new_from_file
    
    @huerto = Huerto.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @huerto }
      format.xml { render xml: @huerto }
    end
  end

  def create_from_file
    
    savefile_huertos(params[:upload])
    error=false
    #begin
      csv=readfile_huertos(params[:upload])
      puts '++++ end read file huertos'
      leidos=0
      csv.each do |row|
        leidos = leidos + 1
      end  
      crear_huertos_from_file(csv, params)
      puts '++++ end crear personas'
    #rescue ArgumentError
    #  error=true
    #end    
    
    
    respond_to do |format|
      if error== false
        format.html { redirect_to url_for(:action=>:index) , :notice =>"Se han generado " + leidos.to_s + " Huertos" }
      else
        format.html { redirect_to url_for(:action=>:new_from_file) , :alert => true, :notice => "No se ha podido procesar el archivo debido un error de codificación de carácteres del archivo" }
      end
    end
  end  
  
  def savefile_huertos(upload)
    name =  upload['datafile'].original_filename
    directory = "#{Rails.root}/tmp"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  def readfile_huertos(upload)
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
  
  def crear_huertos_from_file(csv, params)

# "name", "codigonx" , "direccion", "municipio", "provincia", "comunidad", "codigopostal", "potenciacil"
# "productor" , "x", "y", "icono", "descripcion", "aniomarcha", "foto01", "foto02", "foto03"
# "limiteproduccion", "limiteclientes", "cups"


    leidos=0
    csv.each do |row|
      leidos = leidos + 1
      record = Huerto.new(
          :agrupacion  => row[0], 
          :municipio => row[1],
          :provincia => row[2],
          :comunidad => row[3],         
          :x => row[4],
          :y => row[5],                                    
          :foto01=> row[6],          
          :foto02 => row[7],          
          :foto03 => row[8]        
      )            
      record.save           
    end
  end  
  
end
