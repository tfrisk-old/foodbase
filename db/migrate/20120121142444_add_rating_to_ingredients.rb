class AddRatingToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :rating, :float
  end
end
