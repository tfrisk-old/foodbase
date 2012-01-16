class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
    @manufacturer_id = params[:manufacturer_id]
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update_attributes(params[:manufacturer])
      flash[:notice] = "Homma OK"
      redirect_to manufacturer_path(@manufacturer)
    else
      render action: :edit
    end
  end

  def new
    @manufacturer = Manufacturer.new
  end


  def create
    @manufacturer = Manufacturer.new(params[:manufacturer])
    if @manufacturer.save
      flash[:notice] = "Tallennettu"
      redirect_to manufacturers_path
    else
      render action: :new
    end
  end

end
