class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.sort_companies_by_interest
    Company.joins(:jobs).group(:id).order('avg(level_of_interest) desc').take(3)
  end
end
