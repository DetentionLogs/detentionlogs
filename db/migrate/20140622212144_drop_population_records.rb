class DropPopulationRecords < ActiveRecord::Migration
  def up
    drop_table :population_records
  end

  def down
    create_table :population_records
  end
end
