require_relative 'menu'
require_relative 'sms'

class Order

  attr_reader :selection, :dishes, :menu, :sms

def initialize
  @selection = {}
  @total = 0
  @menu = Menu.new
  @sms = Sms.new
end

def add_order(dish, quantity)
 @selection[dish] = quantity
 order_total
end

def dish_totals
  @selection.map do |dish, quantity|
    menu.price(dish) * quantity
  end
end

def order_total
  dish_totals.inject(:+)
end
end
