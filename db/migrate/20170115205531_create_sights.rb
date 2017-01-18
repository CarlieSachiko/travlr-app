class CreateSights < ActiveRecord::Migration
  def change
    create_table :sights do |t|
      t.string :name
      t.string :address
      t.string :note
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end