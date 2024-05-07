class Product < ApplicationRecord
  validates :name, presence: { on: :create }
  validates :price, presence: { on: :create }

  has_and_belongs_to_many :orders
end
