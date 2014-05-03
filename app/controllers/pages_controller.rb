class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_before_filter :authenticate_admin!
end
