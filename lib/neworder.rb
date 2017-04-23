require_relative './menu.rb'
require_relative './timestamp.rb'
require_relative './sms.rb'

class NewOrder

attr_reader :menu, :order, :sms

  def initialize
    @order = []
    @menu = Menu.new
    @sms = SMS.new
  end

  def add_dish(dish, number)
    number.times { @order << { dish => @menu.items[dish] } }
  end

  def total
    @amount = 0.00
    @order.each { |item| item.each { |dish, price| @amount += price } }
    @amount
  end

  def place_order(given_total)
    raise 'Incorrect total given' if total != given_total
    @sms.send
  end

end
