class AddInformedOnToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :informed_on, :datetime
  end
end
