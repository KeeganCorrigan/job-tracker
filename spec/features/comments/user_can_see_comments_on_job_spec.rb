require 'rails_helper'

describe 'user visits job' do
  before(:each) do
    @company = Company.create!(name: 'Aetna')
    @category = Category.create!(title: 'Finance')
    @job = @company.jobs.create!(title: "Developer", description: 'rekjr', level_of_interest: 70, city: "Denver", category: @category)
  end
  it "can create a comment" do
    visit job_path(@job)

    fill_in "comment[title]", with: "murderer"

    click_button "Add Note"

    expect(current_path).to eq(job_path(@job))
    expect(page).to have_content("murderer")
  end
end
