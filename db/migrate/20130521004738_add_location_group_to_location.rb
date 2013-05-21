class AddLocationGroupToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :location_group, :string
  end
end
