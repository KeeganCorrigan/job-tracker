require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")

    visit new_job_path

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[city]", with: "Denver"
    find('#job_level_of_interest').find(:xpath, 'option[2]').select_option

    find('#job_category_id').find(:xpath, 'option[1]').select_option
    find('#job_company_id').find(:xpath, 'option[1]').select_option

    click_button "Create"

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("2")
    expect(page).to have_content("Denver")
  end
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")

    visit new_job_path

    within ".secondary-heading" do
      click_link "Create a New Category"
    end

    expect(current_path).to eq(new_category_path)
  end
  scenario "user fails to fill out form and clicks create" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")

    visit new_job_path

    click_button "Create"

    expect(current_path).to eq(jobs_path)
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("City can't be blank")
  end
end
