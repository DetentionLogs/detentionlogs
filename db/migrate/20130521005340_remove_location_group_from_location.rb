class RemoveLocationGroupFromLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :location_group
  end

  def down
    add_column :locations, :location_group, :string
  end
end
