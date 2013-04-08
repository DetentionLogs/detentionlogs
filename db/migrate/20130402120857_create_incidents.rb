class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :incident_number
      t.string :incident_type
      t.string :level
      t.string :location
      t.string :location_details
      t.text :summary
      t.datetime :occured_on

      t.timestamps
    end
  end
end
