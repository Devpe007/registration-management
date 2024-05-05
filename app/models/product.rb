class Product < ApplicationRecord
  validates :name, presence: { on: :create }
  validates :price, presence: { on: :create }
end
