class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :registerable,
  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :first_name, :last_name, :group_id, :active


  validates :username, :presence => true, 
                       :uniqueness => true
  validates :password, :presence => true, :on => :create,
                       :confirmation => true,
                       :length => { :within => 8..32 }
	validates :email, :presence => true,
	                  :uniqueness => true,
	                  :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :group_id, :presence => true
#	validates :active, :presence => true
	
	belongs_to :group
  belongs_to :user_location
  has_many :audit
  has_many :calls
  
  # helper for full user name
  def user_full_name
    first_name + " " + last_name
  end

  # helper for full user name
  def full_name
    first_name + " " + last_name
  end

  # used for cancan
  def role?(role_check)
    if self.group.group_name.to_s == role_check.to_s
      return true
    end
  end

  # used for cancan
  def role
    return group.group_name.to_s
  end

end
