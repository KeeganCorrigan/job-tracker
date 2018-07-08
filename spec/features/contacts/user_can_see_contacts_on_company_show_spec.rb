require 'rails_helper'

describe 'user visits company' do
  before(:each) do
    @company = Company.create!(name: 'Aetna')
  end

  it "can create and see a contact" do
    visit company_path(@company)

    fill_in "contact[full_name]", with: "murder jones"
    fill_in "contact[email]", with: "murderer@murderer.com"
    fill_in "contact[position]", with: "murderer"

    click_button "Create Contact"

    expect(current_path).to eq(company_path(@company))
    expect(page).to have_content("murder jones")
    expect(page).to have_content("murderer@murderer.com")
    expect(page).to have_content("murderer")
    expect(Contact.count).to eq(1)
  end

  it 'can update a contact' do
    skip
    visit company_path(@company)

    click_on "edit"

    expect(current_path).to eq()

    fill_in "[title]", with: "Developer"
    fill_in "[description]", with: "So fun!"
    fill_in "[level_of_interest]", with: 80
    fill_in "[city]", with: "Milan"

    find('#job_category_id').find(:xpath,'option[1]').select_option

    click_on "Update"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Milan")
    end
  end
