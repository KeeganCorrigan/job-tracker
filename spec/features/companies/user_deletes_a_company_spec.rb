require 'rails_helper'

describe "User deletes existing company" do
  it "can delete a company" do
    company = Company.create(name: "ESPN")

    visit companies_path

    click_link('delete')

    expect(Company.all.empty?).to be(true)
  end
  it "clicks edit and goes to edit page" do
    company = Company.create(name: "ESPN")

    visit companies_path

    click_link('edit')

    expect(current_path).to eq(edit_company_path(company))
  end
end
