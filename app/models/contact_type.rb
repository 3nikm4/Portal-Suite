class ContactType < ActiveRecord::Base

  validates :contact_type, :presence => true

  has_many :contacts

end
