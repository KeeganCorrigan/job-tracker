require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = Category.create!(title: "iuhasd")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)

    visit job_path(job)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
  end

  it "a user can delete a job from show" do
    category = Category.create!(title: "iuhasd")
    company = Company.create(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)

    expected = "#{job.title} was successfully deleted!"

    visit job_path(job)

    click_link "delete"

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content(expected)
    expect(Job.where(description: 'adfg').count).to eq(0)
  end
end
