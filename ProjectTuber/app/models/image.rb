class Image < ActiveRecord::Base

  validates :name, length: { maximum: 200 }, presence: true
  validates :file_path, length: { maximum: 500 }, presence: true

end
