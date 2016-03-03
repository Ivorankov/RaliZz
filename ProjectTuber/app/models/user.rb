class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\w+/}
  validates :first_name, length: { minimum: 3, maximum: 25 }, presence: true
  validates :last_name, length: { minimum: 3, maximum: 25 }, presence: true
  validates :email, length: { minimum: 3, maximum: 30 }, presence: true #TODO mail validation
end
