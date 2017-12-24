class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.sub_total = 0
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.items.find_or_initialize_by(
      product_id: product_id
    )

    order_item.price = product.price
    order_item.quantity = quantity

    order_item.save
  end

  def remove_item(id:)
    order.items.destroy(id)
  end

end
