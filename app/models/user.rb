class User < ApplicationRecord
  before_create :set_api_key
  has_secure_password

  # validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates :api_key, uniqueness: true

  # relationships
  has_many :gardens

  private

  def set_api_key
    self.api_key = SecureRandom.urlsafe_base64.to_s
  end

end
