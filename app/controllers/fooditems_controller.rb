class FooditemsController < ApplicationController
  def index
    @fooditems = Fooditem.all
  end

  def show
    @fooditem = Fooditem.find(params[:id])
  end

end
