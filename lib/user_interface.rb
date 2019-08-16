require_relative './menu'
require_relative './dish'
require_relative './order'

#check menu, add dish to basket, place order
class UserInterface(basket_case = Basket)

  def initialize
    @basket = []
  end

  def show_menu(menu)
    menu.list
  end

  def add_to_basket(menu, dish_name, quantity, order_class = Order)
    order = order_class.new(menu, dish_name, quantity)
    raise "Dish isn't on menu" if order.nil?

    order.order.each { |dish| @basket << dish }
  end

  def place_order(total)
    raise "Order cancelled" if basket.empty?

    send_text
  end
end
