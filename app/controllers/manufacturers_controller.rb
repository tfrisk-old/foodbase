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

end
