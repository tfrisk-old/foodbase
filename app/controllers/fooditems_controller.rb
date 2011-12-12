class FooditemsController < ApplicationController
  def index
    @fooditems = Fooditem.all
  end

  def show
    @fooditem = Fooditem.find(params[:id])
  end

  def edit
    @fooditem = Fooditem.find(params[:id])
  end

  def update
    @fooditem = Fooditem.find(params[:id])
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

end
