class Project < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, length: { minimum: 10 }, presence: true
end
