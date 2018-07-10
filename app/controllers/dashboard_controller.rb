class DashboardController < ApplicationController
  def index
    @job_grouped_by_city = Job.group_by_city
    @job_level_of_interest = Job.group_by_level_of_interest.to_a
  end
end
