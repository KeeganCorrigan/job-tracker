class Job < ApplicationRecord
  validates :title, :level_of_interest, :description, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.sort_by_city
    order(:city)
  end
end
