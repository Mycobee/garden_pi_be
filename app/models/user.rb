class User < ApplicationRecord
  has_secure_password

  # validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates :api_key, presence: true, uniqueness: true
end
