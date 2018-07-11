require 'rails_helper'

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    company = Company.create!(name: "ESPN")
    visit edit_company_path(company)

    fill_in "company[name]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq(companies_path)
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("ESPN")
  end

  scenario "a user can not leave edit form empty" do
    company = Company.create!(name: "ESPN")

    visit edit_company_path(company)

    fill_in "company[name]", with: ""
    click_button "Update"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Name can't be blank")
    expect(company.name).to eq("ESPN")
  end
end
