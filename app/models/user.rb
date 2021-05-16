class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  # def invalidate_token
  #   update(token: nil)
  # end

  # def self.valid_login?(email, password)
  #   user = find_by(email: email)

  #   user&.authenticate(password)
  # end
end
