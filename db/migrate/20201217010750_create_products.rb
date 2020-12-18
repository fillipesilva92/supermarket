class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :barcode
      t.string :image
      t.string :name
      t.float :price
    end
  end
end
