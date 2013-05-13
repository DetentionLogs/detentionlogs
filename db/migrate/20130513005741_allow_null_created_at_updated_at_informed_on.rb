class AllowNullCreatedAtUpdatedAtInformedOn < ActiveRecord::Migration
  def up
	change_column :incidents, :created_at, :datetime, :null => true
	change_column :incidents, :updated_at, :datetime, :null => true
	change_column :incidents, :informed_on, :datetime, :null => true
  end

  def down
  end
end
