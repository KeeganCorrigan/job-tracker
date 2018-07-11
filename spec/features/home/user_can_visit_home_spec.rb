require "rails_helper"

describe "a user visits home" do
  it "sees number of categories, companies, and jobs" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)

    jobs = Job.all.count
    categories = Category.all.count
    companies = Company.all.count

    visit root_path

    expect(page).to have_content("#{jobs} jobs")
    expect(page).to have_content("#{categories} categories")
    expect(page).to have_content("#{companies} companies")
  end
  it "links to jobs page" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)

    visit root_path

    click_on "here"

    expect(current_path).to eq(jobs_path)
  end
end
