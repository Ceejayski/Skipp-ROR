class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses, id: :uuid do |t|
      t.references :lense, null: false, foreign_key: true, type: :uuid
      t.references :frame, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
