class AddManufacturerIdToFooditems < ActiveRecord::Migration
  def change
    add_column :fooditems, :manufacturer_id, :integer
  end
end
