class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :stock
      t.float :price
      t.integer :currency_id

      t.timestamps
    end
  end
end
