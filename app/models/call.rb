class Call < ActiveRecord::Base

  validates :call_location_id, :presence => true
  validates :call_type_id, :presence => true
  validates :call_notes, :presence => true
  validates :contact_id, :presence => true

  belongs_to :user
  belongs_to :contact
  belongs_to :call_location
  belongs_to :call_type

#attr_accessible :user_id, :contact_id, :call_start, :call_end, :call_reason, :call_notes, :call_location_id, :call_type_id, :call_direction

  def self.search(search, page)
    paginate :per_page => 25, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'id DESC'
  end

end
