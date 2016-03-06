class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\w+/}
  validates :ip, length: { minimum: 3, maximum: 25 }, presence: true
  has_many :projects
end
