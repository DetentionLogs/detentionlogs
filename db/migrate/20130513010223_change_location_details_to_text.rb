class ChangeLocationDetailsToText < ActiveRecord::Migration
  def up
    change_column :incidents, :location_details, :text, :null => true
  end

  def down
  end
end
