class Customer
  def initialize(options)
    options
  end

  def view_menu(restaurant)
    restaurant.show_menu
  end

  def order(order)
    restaurant = order.delete(:restaurant)
    restaurant.receive_order(order)
  end
end