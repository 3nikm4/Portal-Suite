class DeviceProblem < ActiveRecord::Base
  validates :device_problem, :presence => true
  validates :device_problem_status_id, :presence => true

  belongs_to :device_problem_status
  belongs_to :device
end
