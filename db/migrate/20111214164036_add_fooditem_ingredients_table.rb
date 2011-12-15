class AddFooditemIngredientsTable < ActiveRecord::Migration
  def change
    create_table :fooditem_ingredients, :id => false do |t|
      t.integer :fooditem_id
      t.integer :ingredient_id
    end
  end
end
