class Attachment < ActiveRecord::Base
  attr_accessible :description, :file, :name, :publication_date, :update_date
end
