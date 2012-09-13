class Disposable < ActiveRecord::Base
  validates :amount, :presence => true
  validates :par_level, :presence => true
  validates :alert_amount, :presence => true

  belongs_to :location
  belongs_to :disposable_type
end
