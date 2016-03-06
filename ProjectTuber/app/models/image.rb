class Image < ActiveRecord::Base

  belongs_to :project
  validates :name, length: { maximum: 200 }, presence: true
  validates :file_path, length: { maximum: 500 }, presence: true

end
