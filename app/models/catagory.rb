class Catagory < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, :dependent => :nullify
  validates_uniqueness_of :name, :on => :save, :message => "already exist"
  validates_presence_of :name, :on => :save, :message => "can't be blank"
  named_scope :ordered, :order => "weight DESC, created_at ASC"
end
