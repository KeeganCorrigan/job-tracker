require 'rails_helper'

describe "user deletes existing category" do
  it "can delete a category" do
    category = Category.create!(title: "oihsi")

    visit categories_path

    click_link('delete')

    expect(Category.all.empty?).to be(true)
  end
end
