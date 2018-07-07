require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "ojiasd")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, description: 'adfj', city: "New York City", category: category)

    visit company_jobs_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end

  it 'can link to job new' do
    company = Company.create!(name: "ESPN")

    visit company_jobs_path(company)

    click_link 'Create a New Job'

    expect(current_path).to eq(new_company_job_path(company))
  end
end
