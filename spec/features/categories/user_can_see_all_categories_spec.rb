require 'rails_helper'

describe 'user visits categories index' do
  before(:each) do
    @company = Company.create!(name: 'Aetna')
    @category_1 = Category.create!(title: 'Finance')
    @job_1 = @company.jobs.create!(title: "Developer", description: 'rekjr', level_of_interest: 70, city: "Denver", category: @category_1)
    @job_2 = @company.jobs.create!(title: "QA Analyst", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_1)
    @job_3 = @company.jobs.create!(title: "Murderer", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_1)
    @job_4 = @company.jobs.create!(title: "lkjaf", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_1)
    @job_5 = @company.jobs.create!(title: "QAadsfa", description: 'rekjr', level_of_interest: 70, city: "New York City", category: @category_1)
  end

  it 'should see all categories' do

    visit categories_path

    expect(page).to have_content(@category_1.title)
  end

  it 'should link to category show' do

    visit categories_path

    click_link @category_1.title

    expect(page).to have_content(@job_1.title)
    expect(page).to have_content(@job_4.title)
  end
  it 'should go to edit category' do

     visit categories_path

     click_link('edit')

     expect(current_path).to eq(edit_category_path(@category_1))
  end

  it 'should go to create new category' do
    category_1 = Category.create!(title: "iuasd")

    visit categories_path

    within ".secondary-heading" do
      click_link "Create a New Category"
    end

    expect(current_path).to eq(new_category_path)
  end
end
