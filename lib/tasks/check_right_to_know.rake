require File.expand_path('../../api/right_to_know', __FILE__)

namespace :api do

  namespace :right_to_know do

    desc "Update the status of FOI requests on Right To Know"
    task :update => :environment do
      Api::RightToKnow.update! 
    end

  end

end
