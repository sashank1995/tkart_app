class CreateMensInventories < ActiveRecord::Migration
  def change
    create_table :mens_inventories do |t|
      t.string :description
      t.integer :cost

      t.timestamps null: false
    end
  end
end
