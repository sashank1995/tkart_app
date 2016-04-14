class AddQuantityToMensInventory < ActiveRecord::Migration
  def change
    add_column :mens_inventories, :quantity, :integer
  end
end
