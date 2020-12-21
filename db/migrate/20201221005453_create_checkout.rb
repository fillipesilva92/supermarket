class CreateCheckout < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
      t.float :total
      t.string :products
      t.datetime :created_at
      t.string :payment_method
      t.float :change
    end
  end
end
