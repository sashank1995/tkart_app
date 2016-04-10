class CreateWomensInventories < ActiveRecord::Migration
  def change
    create_table :womens_inventories do |t|
      t.string :description
      t.integer :cost

      t.timestamps null: false
    end
  end
end
