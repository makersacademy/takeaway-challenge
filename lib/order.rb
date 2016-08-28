require_relative "dish"

class Order

  def initialize
    @order_content = []
    @checkout_value = nil
  end

  def add_item(dish, quantity)
    @order_content << {dish: dish, quantity: quantity}
  end

  def complete?
    !!checkout_value
  end

  def checkout_order(amount)
    fail "Order cannot be checked out with no dishes" if order_content.empty?
    @checkout_value = amount
  end

  # def total
  # end

  private
  attr_reader :checkout_value, :order_content

end
