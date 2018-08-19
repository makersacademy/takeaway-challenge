require_relative 'menu'
require_relative 'order'
require_relative 'message_mod'

class Takeaway

  include MessageMod

  attr_reader :menu, :orders, :total

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
    @total = 0
    order_string = menu.order.total_order.map { |hash|
      @total += hash[:price]
      "#{hash[:dish]} x #{hash[:quantity]}"
    }.join(", ")

    "Order: #{order_string}  Total: £#{total}"
  end

  def confirm_order(amount)
    fail "Incorrect amount given" unless total == amount
    send_message
  end

end
