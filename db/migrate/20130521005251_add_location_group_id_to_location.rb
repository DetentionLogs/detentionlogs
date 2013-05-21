class AddLocationGroupIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :location_group_id, :integer
  end
end
