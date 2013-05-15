class AddAttachmentDetailedReportToIncidents < ActiveRecord::Migration
  def self.up
    change_table :incidents do |t|
      t.attachment :detailed_report
    end
  end

  def self.down
    drop_attached_file :incidents, :detailed_report
  end
end
