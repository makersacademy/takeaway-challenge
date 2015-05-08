class Customer
  attr_reader :name, :phone

  def initialize(options)
    @name = options[:name]
    @phone = options[:phone]
  end

  def view_menu(restaurant)
    restaurant.show_menu
  end

  def order(order)
    restaurant = order.delete(:restaurant)
    order.merge!(from: self)
    restaurant.receive_order(order)
  end
end