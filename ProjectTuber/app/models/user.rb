class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :projects

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\w+/}
end
