require_relative 'order'

class Ristorante
  attr_reader :current_order, :order

  def initialize(order_klass = Order.new)
    @order = order_klass
  end

  def menu_list
  menu_list = {1=>[:egg_fried_rice, 3],
               2=>[:chicken_legs, 2],
               3=>[:miso_soup, 3],
               4=>[:sofrito, 5],
               5=>[:pasta, 1],
               6=>[:garlic_bread, 1.5]}
  end

  def menu
    @menu = menu_list
  end

  def place_order
    fail "Wrong total amount" if order.wrong_total?
    order.assign_order_number
    order.send_sms
  end

  def select_dishes(number, quantity)
    dish = menu[number][0]
    price = menu[number][1] * quantity
    order.set_current_order(dish, quantity, price)
  end


end
