class Project < ActiveRecord::Base

  belongs_to :user
  has_many :images
  validates :title, length: { minimum: 3, maximum: 30 }, presence: true
  validates :description, length: { minimum: 10, maximum: 500 }, presence: true
  validates :link_to_source, length: { maximum: 1000 }, presence: true #TODO url validation
  validates :link_to_video, length: { maximum: 1000 }, presence: true #TODO url validation
  self.per_page = 3
end
