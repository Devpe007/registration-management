class User < ApplicationRecord
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }
end
