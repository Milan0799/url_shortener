class User < ApplicationRecord
  # Ensure email is unique and present
  validates :email, presence: true, uniqueness: true
  has_secure_password

  # Method to generate JWT token
  def generate_jwt
    JWT.encode({ user_id: self.id, exp: 24.hours.from_now.to_i }, Rails.application.secret_key_base)
  end
end
