class Contact < ApplicationRecord
  validates_presence_of :full_name, :email, :position
  belongs_to :company
end
