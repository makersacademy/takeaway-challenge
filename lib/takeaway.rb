require 'twilio-ruby'
require_relative 'menu'
require_relative 'text'


class TakeAway

  include Text

  attr_reader :menu, :order, :order_total

  def initialize
    @menu = Menu.new
    @order = []
    @order_total = 0
  end

  def read_menu
    @menu.menu_list.each { |key, value| puts "#{key}, £#{value}"}
  end

  def add_item_to_order(menu_item, quantity=1)
    quantity.times { |order| @order << menu_item}
    total(menu_item, quantity)
  end

  def total_cost
    #{"Your current order is: #{@order}"}
    'The total cost to pay is: £' + @order_total.to_s
  end

  def pay(amount)
    raise 'Error: amount does not equal total cost!' unless amount == @order_total
    "Thank you for your order, you will shortly recieve confirmation."
    send_text
    @order_total = 0
  end

private

  def total(menu_item, quantity)
    @order_total += menu.menu_list[menu_item] * quantity
  end

end