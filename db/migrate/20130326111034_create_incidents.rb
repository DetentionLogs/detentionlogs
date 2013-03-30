class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.string :location
      t.string :incidenttype
      t.datetime :occurence_date

      t.timestamps
    end
  end
end
