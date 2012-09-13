class DisposableType < ActiveRecord::Base
  validates :disposable_type, :presence => true
  
  has_many :disposable
end
