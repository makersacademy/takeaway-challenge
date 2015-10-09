require_relative 'menu'
require_relative 'text'
require 'twilio-ruby'

class Customer
  include Text

  attr_reader :menu, :order, :order_total

  def initialize
    @menu = Menu.new
    @order = []
    @order_total = 0
  end

  def see_menu
    @menu.menu_items.each { |k, v| "#{k}, #{v}" }
  end

  def select_dishes(dish, quantity=1)
    fail "This dish is not on our menu" unless menu.menu_items.key?(dish)
    quantity.times { |order| @order << dish }
    total_order(dish, quantity)
  end

  def total_cost
    '£' + @order_total.to_s
  end

  def pay(amount)
    fail "The amount given does not equal the total cost" unless amount == @order_total
    "Thank you, you will receive a confirmation text shortly"
    send_text
  end

  def total_order(dish, quantity)
    @order_total += menu.menu_items[dish] * quantity
  end

end
