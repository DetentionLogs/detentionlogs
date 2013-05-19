class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      t.string :file
      t.datetime :publication_date
      t.datetime :update_date

      t.timestamps
    end
  end
end
