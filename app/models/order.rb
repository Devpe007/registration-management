class Order < ApplicationRecord
  belongs_to :client

  has_and_belongs_to_many :products

  def client_name
    client = Client.find_by(id: self.client_id)
    client.name if client
  end

  def order_value
    total_price = 0

    orders = OrdersProducts.where(order_id: id)

    orders.each do |order|
      product = Product.find_by(id: order.product_id)

      total_price += product.price
    end

    return total_price
  end
end
