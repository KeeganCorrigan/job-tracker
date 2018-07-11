require 'rails_helper'

describe Company, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it { should have_many(:jobs) }
    it { should have_many(:contacts) }
  end

  describe "class methods" do
    describe ".sort_companies_by_interest" do
      it "sorts companies by average interest and takes top three" do
        company_1 = Company.create!(name: "3")
        company_2 = Company.create!(name: "2")
        company_3 = Company.create!(name: "4")
        company_4 = Company.create!(name: "1")
        category = Category.create!(title: "e")
        job_1 = company_1.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "a", category: category)
        job_2 = company_1.jobs.create!(title: "Developer", level_of_interest: 2, description: 'adfj', city: "e", category: category)
        job_3 = company_1.jobs.create!(title: "Developer", level_of_interest: 3, description: 'adfj', city: "c", category: category)
        job_4 = company_2.jobs.create!(title: "Developer", level_of_interest: 2, description: 'adfj', city: "d", category: category)
        job_5 = company_2.jobs.create!(title: "Developer", level_of_interest: 3, description: 'adfj', city: "b", category: category)
        job_6 = company_3.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "d", category: category)
        job_7 = company_3.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "b", category: category)
        job_8 = company_4.jobs.create!(title: "Developer", level_of_interest: 4, description: 'adfj', city: "d", category: category)
        job_9 = company_4.jobs.create!(title: "Developer", level_of_interest: 6, description: 'adfj', city: "b", category: category)

        expected = [company_4, company_2, company_1]

        expect(Company.sort_companies_by_interest).to eq(expected)
      end
    end
  end
end
