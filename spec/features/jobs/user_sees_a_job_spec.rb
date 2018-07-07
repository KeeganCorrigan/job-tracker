require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = Category.create!(title: "iuhasd")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
  end

  xit "a user can delete a job from show" do
    category = Category.create!(title: "iuhasd")
    company = Company.create(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)

    expected = "#{job.title} was successfully deleted!"

    visit company_job_path(company, job)

    click_link "Delete"

    expect(current_path).to eq(company_jobs_path(company))

    expect(page).to have_content(expected)

    within("#job-container") do
      expect(page).to_not have_content(job.title)
    end
  end
end
