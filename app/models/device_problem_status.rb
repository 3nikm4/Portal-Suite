class DeviceProblemStatus < ActiveRecord::Base
  validates :device_problem_status, :presence => true

  has_many :device_problem
end
