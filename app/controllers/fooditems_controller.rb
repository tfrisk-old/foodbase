class FooditemsController < ApplicationController
  def index
    @fooditems = Fooditem.all
  end

  def show
    @fooditem = Fooditem.find(params[:id])
    @ingredient_list = @fooditem.ingredients.all
  end

  def edit
    @fooditem = Fooditem.find(params[:id])
    @ingredient_list = @fooditem.ingredients.all
    @manufacturer_list = Manufacturer.all
  end

  def update
    @fooditem = Fooditem.find(params[:id])
    # append manufacturer selection on params[]
    #@manufacturer = Manufacturer.find(params[:m])
    if @fooditem.update_attributes(params[:fooditem])
      flash[:notice] = "Homma OK"
      redirect_to fooditem_path(@fooditem)
    else
      render action: :edit
    end
  end

  def new
    @fooditem = Fooditem.new
  end

  def create
    @fooditem = Fooditem.new(params[:fooditem])
    if @fooditem.save
      flash[:notice] = "Tallennettu"
      redirect_to fooditems_path
    else
      render action: :new
    end
  end

  def destroy
    @fooditem = Fooditem.find(params[:id])
    @fooditem.destroy
    flash[:notice] = "Poistettu"
    redirect_to fooditems_path
  end

end
