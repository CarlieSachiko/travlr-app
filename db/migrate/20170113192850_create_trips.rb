class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.date :startdate
      t.date :enddate

      t.timestamps null: false
    end
  end
end
