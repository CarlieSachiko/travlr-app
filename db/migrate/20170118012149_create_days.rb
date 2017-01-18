class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.references :trip, index: true, foreign_key: true
      t.integer :number
      t.string :location
      t.string :note
      t.string :accommodation
      t.string :activities

      t.timestamps null: false
    end
  end
end
