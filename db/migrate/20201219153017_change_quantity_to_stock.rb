class ChangeQuantityToStock < ActiveRecord::Migration[6.0]
  def change
    change_table :stocks do |t|
      t.change :quantity, :integer
    end
  end
end
