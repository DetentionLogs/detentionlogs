# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://detentionlogs.com.au"

SitemapGenerator::Sitemap.create do
  add '/about'
  add '/investigations', :priority => 0.7
  add '/investigations/recipe'
  add '/glossary', :priority => 0.9
  add '/principles'
  add '/contribute'
  add '/data/incidents', :priority => 0.9
  add '/data/incidents/about', :priority => 0.9

  Incident.find_each do |incident|
    add incident_path(incident), :lastmod => incident.updated_at
  end
end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
