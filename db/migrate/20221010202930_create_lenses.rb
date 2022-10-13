class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses, id: :uuid do |t|
      t.string :color
      t.text :description
      t.integer :prescription_type
      t.integer :lens_type
      t.integer :stock
      t.float :price
      t.integer :currency_id

      t.timestamps
    end
  end
end
