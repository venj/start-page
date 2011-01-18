class AdminController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @bookmarks = current_user.bookmarks(:all, :conditions => {:order => "catagory_id ASC, weight DESC"})
    @catagories = current_user.catagories(:all, :conditions => {:order => "id"})
  end
end
