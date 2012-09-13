class LocationType < ActiveRecord::Base
  validates :location_type, :presence => true
  
  has_many :location
end
