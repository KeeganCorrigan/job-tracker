require 'rails_helper'

describe "User visits job edit" do
  it "can update a job" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)

    visit job_path(job)

    click_on "Edit"

    expect(current_path).to eq(edit_job_path(job))

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Milan"

    find('#job_category_id').find(:xpath,'option[1]').select_option

    click_on "Update"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Milan")
  end
end
