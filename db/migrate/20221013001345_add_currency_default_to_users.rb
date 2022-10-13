class AddCurrencyDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :currency_id, :integer, default: 1
  end
end
