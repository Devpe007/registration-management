class Order < ApplicationRecord
  belongs_to :client

  has_and_belongs_to_many :products

  def client_name
    client = Client.find_by(id: self.client_id)
    client.name if client
  end
end
