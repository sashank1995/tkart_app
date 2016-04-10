class AddImageToWomensInventories < ActiveRecord::Migration
  def change
    add_column :womens_inventories, :image, :string
  end
end
