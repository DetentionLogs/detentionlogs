class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :geoloc

      t.timestamps
    end
  end
end
