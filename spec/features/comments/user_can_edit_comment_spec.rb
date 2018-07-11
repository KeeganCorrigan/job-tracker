require 'rails_helper'

describe "user deletes existing comment" do
  it "can delete a comment" do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)
    comment = job.comments.create(content: 'hle')

    visit job_path(job)

    within "#comment-#{comment.id}" do
      click_link('delete')
    end

    expect(Comment.all.empty?).to be(true)
    expect(page).to have_content("comment deleted!")
  end

  it 'can update a comment' do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)
    comment = job.comments.create(content: 'hle')

    visit job_path(job)

    within "#comment-#{comment.id}" do
      click_on "edit"
    end

    expect(current_path).to eq(edit_job_comment_path(job, comment))

    fill_in "comment[content]", with: "Developer"

    click_on "Update"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("Developer")
  end

  it 'can update a comment' do
    company = Company.create!(name: "ESPN")
    category_1 = Category.create!(title: "iuasd")
    job = company.jobs.create!(title: 'lkjds', description: 'description', level_of_interest: 22, city: 'denver', category: category_1)
    comment = job.comments.create(content: 'hle')

    visit edit_job_comment_path(job, comment)

    fill_in "comment[content]", with: ""

    click_on "Update"

    expect(current_path).to eq(job_comment_path(job, comment))
    expect(page).to have_content("Content can't be blank")
  end
end
