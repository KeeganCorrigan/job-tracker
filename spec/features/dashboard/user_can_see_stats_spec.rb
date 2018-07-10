require 'rails_helper'

describe 'a user visits dashboard' do
  before(:each) do
    @company_1 = Company.create!(name: "third")
    @company_2 = Company.create!(name: "second")
    @company_3 = Company.create!(name: "fourth")
    @company_4 = Company.create!(name: "first")
    @category = Category.create!(title: "e")
    @job_1 = @company_1.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "a", category: @category)
    @job_2 = @company_1.jobs.create!(title: "Developer", level_of_interest: 2, description: 'adfj', city: "e", category: @category)
    @job_3 = @company_1.jobs.create!(title: "Developer", level_of_interest: 3, description: 'adfj', city: "c", category: @category)
    @job_4 = @company_2.jobs.create!(title: "Developer", level_of_interest: 2, description: 'adfj', city: "d", category: @category)
    @job_5 = @company_2.jobs.create!(title: "Developer", level_of_interest: 3, description: 'adfj', city: "b", category: @category)
    @job_6 = @company_3.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "d", category: @category)
    @job_7 = @company_3.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "b", category: @category)
    @job_8 = @company_4.jobs.create!(title: "Developer", level_of_interest: 4, description: 'adfj', city: "d", category: @category)
    @job_9 = @company_4.jobs.create!(title: "Developer", level_of_interest: 6, description: 'adfj', city: "b", category: @category)

  end
  it 'can can see a count of jobs by level of interest' do

    visit dashboard_index_path

    expect(page).to have_content("Dashboard")
  end
  it "displays a list of top three companies sorted by interest" do

    visit dashboard_index_path
    
    expect(page).to have_text("first\nsecond\nthird")
  end
end
