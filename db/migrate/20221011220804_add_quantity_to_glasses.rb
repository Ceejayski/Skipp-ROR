class AddQuantityToGlasses < ActiveRecord::Migration[7.0]
  def change
    add_column :glasses, :quantity, :integer
    add_column :glasses, :total_price, :float
    add_column :glasses, :currency_id, :integer
  end
end
