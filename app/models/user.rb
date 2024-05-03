class User < ApplicationRecord
  has_secure_password

  validates :password_digest, presence: { on: :create }, length: { minimum: 8, allow_blank: true }

  def self.auth(email, password)
    user = User.where(email: email).first
    user && user.authenticate(password) ? user : nil
  end
end
