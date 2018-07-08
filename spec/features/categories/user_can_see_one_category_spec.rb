require 'rails_helper'

describe 'user visits category show' do
  before(:each) do
    @company = Company.create!(name: 'Aetna')
    @category_1 = Category.create!(title: 'Finance')
    @category_2 = Category.create!(title: 'Education')
    @category_3 = Category.create!(title: 'Music')
    @job_1 = @company.jobs.create!(title: "Developer", description: 'Murderer', level_of_interest: 70, city: "Denver", category: @category_1)
    @job_2 = @company.jobs.create!(title: "QA Analyst", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_2)
    @job_3 = @company.jobs.create!(title: "Murderer", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_3)
    @job_4 = @company.jobs.create!(title: "lkjaf", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_1)
    @job_5 = @company.jobs.create!(title: "QAadsfa", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_2)
  end

  it 'should see one category' do

    visit "/jobs?category=#{@category_1.title}"

    expect(page).to have_content(@job_1.title)
  end
end
