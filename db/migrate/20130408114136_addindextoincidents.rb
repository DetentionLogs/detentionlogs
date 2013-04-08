class Addindextoincidents < ActiveRecord::Migration
  def up
	add_index :incidents, [:location, :occured_on, :incident_type]
  end

  def down
  end
end
