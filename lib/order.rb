require_relative 'text'
require_relative 'menu'

class Order
  include Menu

  attr_accessor :contents

  def initialize
    @contents = []
  end

  def add_item(dish, quantity)
    if display_menu.has_key?(dish)
      @contents << dish
      @contents << quantity
    else
      fail 'Item not on menu'
    end
  end

  def order_total(total_price)
    prices = []
    order = Hash[@contents.each_slice(2).to_a]
    order.each do |dish, quantity|
    prices << display_menu[dish]*quantity
    end
    if total_price == prices.inject(:+)
      true
    else
      false
    end
  end
end
