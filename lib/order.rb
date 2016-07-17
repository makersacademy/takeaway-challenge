require_relative 'menu'
require "awesome_print"


class Order

  attr_reader :basket, :menu, :basket_total

  def initialize
    @basket = []
    @basket_total = 0
    @menu = Menu.new.menu
  end

  def order_item(name, quantity)
    item_total = @menu[name] * quantity
    @basket << {name: name, quantity: quantity, item_total: item_total}
  end

  def basket_total
    @basket.each do |hash|
    @basket_total += hash[:item_total]
    end
    @basket_total
  end

  def print_basket
    puts "------------------------------"
    puts "Your order with Tommy Takeaway"
    puts "------------------------------"
    puts @basket
    puts "------------------------------"
    puts "Your total for this order is: "
    puts @basket_total
    puts "------------------------------"
  end

  def awesome_print_basket
    ap @basket, :indent => -2
  end

end
