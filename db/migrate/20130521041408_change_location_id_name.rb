class ChangeLocationIdName < ActiveRecord::Migration
  def up
    add_column :incidents, :location_id, :integer
  end

  def down
  end
end
