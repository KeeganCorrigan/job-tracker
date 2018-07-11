require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "murderer"

    click_button "Create"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("murderer")
    expect(Category.count).to eq(1)
  end

  it 'uses existing catetory name, is redirected to category form' do
    existing = 'I exist'
    category = Category.create!(title: existing)

    visit new_category_path

    fill_in "category[title]", with: existing

    click_button "Create"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Create a new category here!")
    expect(Category.all.length).to eq(1)
  end
end
