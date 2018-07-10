require 'rails_helper'

describe 'user visits job' do
  before(:each) do
    @company = Company.create!(name: 'Aetna')
    @category = Category.create!(title: 'Finance')
    @job = @company.jobs.create!(title: "Developer", description: 'rekjr', level_of_interest: 70, city: "Denver", category: @category)
  end

  it "can create and see a comment" do
    visit job_path(@job)

    fill_in "comment[content]", with: "murderer"

    click_button "Create Comment"

    expect(current_path).to eq(job_path(@job))
    expect(page).to have_content("murderer")
    expect(Comment.count).to eq(1)
  end

  it "can see date and time of comment" do
    comment = @job.comments.create!(content: "ohasdiuh")

    visit job_path(@job)

    expect(page).to have_content(comment.created_at.strftime('%Y-%m-%d %H:%M:%S'))
  end
end
