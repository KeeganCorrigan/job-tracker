require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "adsj")
    visit edit_category_path(category)

    fill_in "category[title]", with: "murderer"

    click_button "Update"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("murderer")
    expect(page).to_not have_content("asdj")
  end

  scenario "a user can edit a category" do
    category = Category.create!(title: "adsj")
    visit edit_category_path(category)

    fill_in "category[title]", with: ""

    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Title can't be blank")
    expect(category.title).to eq("adsj")
  end
end
