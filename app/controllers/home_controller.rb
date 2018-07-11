class HomeController < ApplicationController
  def index
    @disable_footer = true
    @job_count = Job.all.count
    @company_count = Company.all.count
    @category_count = Category.all.count
  end
end
