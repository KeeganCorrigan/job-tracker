class Comment < ApplicationRecord
  validates_presence_of :user_name, :content
  belongs_to :job
end
