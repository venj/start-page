class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :catagory
  validates_uniqueness_of :link, :on => :save, :message => "already exist"
  validates_presence_of :title, :on => :save, :message => "can't be blank"
  validates_presence_of :link, :on => :save, :message => "can't be blank"
  
  named_scope :uncatagorized, :conditions => {:catagory_id => nil}
end
