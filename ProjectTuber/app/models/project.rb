class Project < ActiveRecord::Base

  validates :title, length: { minimum: 3, maximum: 30 }, presence: true
  validates :description, length: { minimum: 10, maximum: 500 }, presence: true
  validates :link_to_source, length: { maximum: 1000 }, presence: true #TODO url validation
  self.per_page = 5
end
