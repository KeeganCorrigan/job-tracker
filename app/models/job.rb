class Job < ApplicationRecord
  validates :title, :level_of_interest, :description, :city, presence: true

  belongs_to :company
  belongs_to :category

  has_many :comments, dependent: :destroy

  def self.sort_by_city
    order(:city)
  end

  def self.group_by_city
    group(:city).count
  end

  def self.sort_by_interest
    order("level_of_interest desc")
  end

  def self.group_by_level_of_interest
    order("level_of_interest asc").group(:level_of_interest).count
  end
end
