class HomeController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @catagory_bookmarks = []
    current_user.catagories.ordered.each do |cat|
      @catagory_bookmarks << [cat, cat.bookmarks.ordered] unless cat.nil?
    end
  end

end
