# Controller for the home page
class HomeController < ApplicationController
  before_filter :authenticate_admin!, except: [:frontpage]

  def frontpage
  end
end
