require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company = Company.create!(name: "ESPN")
    company_two = Company.create!(name: "Disney")

    visit companies_path

    expect(page).to have_content("ESPN")
  end
  
  it 'can link to company new' do

    visit companies_path

    click_link 'Create a New Company'

    expect(current_path).to eq(new_company_path)
  end
end
