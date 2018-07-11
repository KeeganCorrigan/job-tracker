require 'rails_helper'

describe "user creates a comment" do
  it "can see comment on job page" do
    content = "looks good"
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)

    visit job_path(job)

    fill_in "comment[content]", with: content

    click_on "Create Comment"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content(content)
  end
  it "clicks create without filling out comment" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)

    visit job_path(job)

    click_on "Create Comment"

    expect(current_path).to eq(job_path(job))
    expect(Comment.count).to eq(0)
  end
end
