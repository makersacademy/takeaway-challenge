require_relative 'menu'
require_relative 'order'

class Customer
# Improvements:
  # customer to remove items from order (.remove_dish(dish, quantity))

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
    # raise error if dish_num isn't an integer
    # raise error if dish_number is on menu (i.e. too high or too low)
    # raise error if quanity is < 1

    @order.add(dish_num, quantity)
  end

  def remove_dish(dish, quantity)
    # raise_error if dish isn't in order
    # raise_error if quanity is < 1

    @order.remove(dish, quantity)
  end

  def place_order
    @order.confirmed(@phone_number)
  end

end
