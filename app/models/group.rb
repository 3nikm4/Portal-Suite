class Group < ActiveRecord::Base

  validates :group_name, :presence => true

  has_many :users

end
