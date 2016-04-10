class AddPictureToMensInventories < ActiveRecord::Migration
  def change
    add_column :mens_inventories, :picture, :string
  end
end
