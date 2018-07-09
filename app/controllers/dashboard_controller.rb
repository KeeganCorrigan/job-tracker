class DashboardController < ApplicationController
  def index
    @job_level_of_interest = Job.group_by_level_of_interest.to_a
  end
end
