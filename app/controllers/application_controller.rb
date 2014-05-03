# root controller for the whole application
class ApplicationController < ActionController::Base
  before_filter :authenticate_admin!

  protect_from_forgery
end
