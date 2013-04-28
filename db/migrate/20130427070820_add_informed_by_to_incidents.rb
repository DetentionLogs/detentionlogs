class AddInformedByToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :informed_by, :string
  end
end
