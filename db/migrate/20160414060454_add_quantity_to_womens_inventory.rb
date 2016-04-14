class AddQuantityToWomensInventory < ActiveRecord::Migration
  def change
    add_column :womens_inventories, :quantity, :integer
  end
end
