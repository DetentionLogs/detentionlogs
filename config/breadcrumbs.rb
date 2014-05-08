crumb :root do
  link "Home", root_path
end

crumb :incidents do
  link "Incident Explorer", incidents_path, title: "Explore incident records from Australia's immigration detention network"
end

crumb :incident do |incident|
  link "Incident Report #{incident.incident_number}", incident_path(incident)
  parent :incidents
end

crumb :incident_adopt do |incident|
  link "Adopt", incident_adopt_path(incident)
  parent :incident, incident
end

crumb :about_incidents do
  link "About Incident Reports", about_incidents_path
  parent :incidents
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
