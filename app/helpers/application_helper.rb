module ApplicationHelper
	def title(page_title)
	  content_for :title, page_title.to_s
	end
	
	def description(page_description)
	  content_for :description, page_description.to_s
	end
	
end