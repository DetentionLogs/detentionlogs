class AddIncidentCountToLocation < ActiveRecord::Migration
  def up
    add_column :locations, :incidents_count, :integer, :default => 0

    Location.reset_column_information
    Location.find(:all).each do |l|
        l.update_attribute :incidents_count, l.incidents.length
    end
  end

  def down
    remove_column :locations, :incidents_count
  end
end
