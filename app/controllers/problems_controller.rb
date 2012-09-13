class ProblemsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @devices = Device.DeviceProblem.DeviceProblemStatus.find_all_by_device_problem_status("Unsolved")
  end
  
  # GET problems/solved
  def solved
    @devices = Device.DeviceProblem.DeviceProblemStatus.find_all_by_device_problem_status("Solved")
  end

end
