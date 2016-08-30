require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :menu, :current_order, :total

  def initialize(menu = Menu.new, message = Message.new)
    @menu = menu
    @current_order = []
    @total = 0
    @message = message
  end

  def add_dish(dish, quantity = 1)
    raise "Unfortuantely, we do not have this dish." unless menu.view_menu.include?(dish)
    @current_order << [dish, quantity]
    @total += @menu.view_menu[dish] * quantity
  end

  def check_order
    current_order.map {|dish, qty| @menu.view_menu[dish] * qty}.inject(0, :+) == @total
    "Your total checks out."
  end

  def place_order
    @message.send
    "Thank you for your order."
  end
end

