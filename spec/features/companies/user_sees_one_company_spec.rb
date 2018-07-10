require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "ojsd")
    category = Category.create!(title: "iuhasd")
    job_1 = company_1.jobs.create!(title: "Developer", level_of_interest: 4, description: 'adfj', city: "Denver", category: category)
    job_2 = company_2.jobs.create!(title: "Deadsasd", level_of_interest: 3, description: 'adf', city: "Denver", category: category)


    visit company_path(company_1)

    expect(current_path).to eq("/companies/#{company_1.id}")
    expect(page).to have_content(company_1.name)
    expect(page).to have_content(job_1.title)
    expect(page).to_not have_content(job_2.title)
  end
end
