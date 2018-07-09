require 'rails_helper'

describe Job do
  before(:each) do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "ojiasd")
    @job_1 = company.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "a", category: category)
    @job_2 = company.jobs.create!(title: "Developer", level_of_interest: 1, description: 'adfj', city: "e", category: category)
    @job_3 = company.jobs.create!(title: "Developer", level_of_interest: 2, description: 'adfj', city: "c", category: category)
    @job_4 = company.jobs.create!(title: "Developer", level_of_interest: 2, description: 'adfj', city: "d", category: category)
    @job_5 = company.jobs.create!(title: "Developer", level_of_interest: 3, description: 'adfj', city: "b", category: category)
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:level_of_interest) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:city) }
  end

  describe "relationships" do
    it { should belong_to(:company) }
    it { should have_many(:comments) }
  end

  describe "class methods" do
    describe ".sort_by_city" do
      it "sorts jobs by location" do

        expect(Job.sort_by_city).to eq([@job_1, @job_5, @job_3, @job_4, @job_2])
      end
    end
    describe ".group_by_level_of_interest" do
      it "group jobs by level of interest" do

        expected = { 1 => 2, 2 => 2, 3 => 1 }

        expect(Job.group_by_level_of_interest).to eq(expected)
      end
    end
  end
end
