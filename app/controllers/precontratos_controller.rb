class PrecontratosController < ApplicationController
  # GET /precontratos
  # GET /precontratos.json
  before_filter :someonesigned!
  before_filter :finduser
  
  def index
    
    @precontratos = Precontrato.actualuser(@user.id, false).find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @precontratos }
    end
  end

  # GET /precontratos/1
  # GET /precontratos/1.json
  def show

    @precontrato = Precontrato.actualuser(@user.id, ( @user.has_role? :admin )).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @precontrato }
    end
  end

  # GET /precontratos/new
  # GET /precontratos/new.json
  def new
    @precontrato = Precontrato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @precontrato }
    end
  end

  # GET /precontratos/1/edit
  def edit
    puts 'hola'
    puts admin_signed_in?    
    @precontrato = Precontrato.actualuser(@user.id, ( @user.has_role? :admin ) ).find(params[:id])
    session[:precontrato_id] = @precontrato.id
    redirect_to contratos_steps_path 

  end

  # POST /precontratos
  # POST /precontratos.json
  def create
    @precontrato = Precontrato.new(params[:precontrato])
    @precontrato.owner_id=@user.id
    respond_to do |format|
      if @precontrato.save
        format.html { redirect_to @precontrato, notice: 'Precontrato was successfully created.' }
        format.json { render json: @precontrato, status: :created, location: @precontrato }
      else
        format.html { render action: "new" }
        format.json { render json: @precontrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /precontratos/1
  # PUT /precontratos/1.json
  def update
    @precontrato = Precontrato.actualuser(@user.id, ( @user.has_role? :admin )).find(params[:id])

    respond_to do |format|
      if @precontrato.update_attributes(params[:precontrato])
        format.html { redirect_to @precontrato, notice: 'Precontrato was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @precontrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precontratos/1
  # DELETE /precontratos/1.json
  def destroy
    @precontrato = Precontrato.actualuser(@user.id, ( @user.has_role? :admin )).find(params[:id])
    @precontrato.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
