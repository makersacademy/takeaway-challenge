require_relative 'menu'
require_relative 'order'

class Customer
# Improvements:
  # make it possible for customer to remove items from order (.remove_dish(dish, quantity_to_remove))

  def initialize(phone_number = ENV['CUSTOMER_NUMBER'], menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @phone_number = phone_number
  end

  def show_menu
    @menu.display
  end

  def show_order
    @order.display
  end

  def select_dish(dish_num, quantity = 1)
    @order.add(dish_num, quantity)
  end

  def place_order
    @order.confirmed(@phone_number)
  end

end
