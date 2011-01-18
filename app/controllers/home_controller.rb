class HomeController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @catagories = current_user.catagories
    @uncatagorized_bookmarks = current_user.bookmarks.uncatagorized
  end

end
