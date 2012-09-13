class Contact < ActiveRecord::Base

  validates :contact_type_id, :presence => true 
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :dob, :presence => true, :if => :is_patient?

  has_many :calls
  belongs_to :contact_type
  
  def is_patient?
    contact_type_id == 1
  end

#  def is_patient?
#    (contact_type_id == 1).tap { |r| STDERR.puts "is_patient? returning #{r} for #{self.inspect} with contact_type_id: #{contact_type_id}" }
#  end

  def full_name
    first_name + " " + last_name
  end

  def full_name_last
    last_name + ", " + first_name
  end

end
