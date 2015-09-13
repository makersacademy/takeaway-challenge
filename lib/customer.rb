require_relative 'order'

class Customer
  attr_reader :orders
  def initialize(orders = Order.new)
    @orders = orders
  end

  def place_order(menu = Menu.new)
    orders.greet
    orders.present(menu)
    orders.choose_dish
    orders.choose_how_many
    orders.cart(menu)
  end

end
