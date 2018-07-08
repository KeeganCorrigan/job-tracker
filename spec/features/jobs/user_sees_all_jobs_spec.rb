require 'rails_helper'

describe "User visits jobs index" do
  scenario "a user sees all the jobs" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "ojiasd")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, description: 'adfj', city: "New York City", category: category)

    visit jobs_path

    expect(page).to have_content(company.name)
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end

  it 'can link to job new' do
    company = Company.create!(name: "ESPN")

    visit jobs_path

    click_link 'Create a New Job'

    expect(current_path).to eq(new_job_path)
  end

  it 'can delete a job' do
    category = Category.create!(title: "iuhasd")
    company = Company.create(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)

    expected = "#{job.title} was successfully deleted!"

    visit jobs_path

    click_link('delete')

    expect(current_path).to eq(jobs_path)
    expect(page).to_not have_content(company.name)
  end

  it 'can link to edit form' do
    category = Category.create!(title: "iuhasd")
    company = Company.create(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, description: 'adfj', city: "Denver", category: category)

    visit jobs_path

    click_link('edit')

    expect(current_path).to eq(edit_job_path(job))
  end
end
