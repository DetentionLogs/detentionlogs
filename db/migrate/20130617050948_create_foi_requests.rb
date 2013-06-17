class CreateFoiRequests < ActiveRecord::Migration
  def up
    create_table :foi_requests do |t|
      t.integer :incident_id
      t.string :described_state
      t.string :display_status
      t.string :url_title
      t.timestamps
    end
    add_index :foi_requests, :url_title, :unique => true
    add_index :foi_requests, :incident_id
  end

  def down
    drop_table :foi_requests
  end
end
