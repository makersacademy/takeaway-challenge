require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :orders

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    menu.show_menu
  end

  def order(dish, quantity)
    menu.order_dish(dish, quantity)
  end

  def check_order
    total = 0
    order_string = menu.order.total_order.map { |hash|
      total += hash[:price]
      "#{hash[:dish]} x #{hash[:quantity]}"
    }.join(", ")

    "Order: #{order_string}  Total: £#{total}"
  end
end
