require 'rails_helper'

describe "User creates a new company" do
  it "clicks on create after filling in form" do
    visit new_company_path

    company_name = "ESPN"

    fill_in "company[name]", with: company_name
    click_button "Create"

    expect(current_path).to eq("/companies/#{Company.last.id}")
    expect(page).to have_content(company_name)
    expect(Company.count).to eq(1)
  end
  it "clicks on create and does not fill out form" do
    visit new_company_path

    click_button "Create"

    expect(current_path).to eq(companies_path)
    expect(page).to have_content("Name can't be blank")
  end
end
