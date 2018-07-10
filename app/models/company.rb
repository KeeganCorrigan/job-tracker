class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.sort_companies_by_interest
    # Company.joins(:jobs).select( company.id = job.id).avg(:level_of_interest AS avg_level_of_interest).order(avg_level_of_interest ASC).
  end

end
