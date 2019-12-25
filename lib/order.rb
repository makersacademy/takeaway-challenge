require_relative "menu"
require_relative "text"
require "dotenv/load"

class Order
  
  attr_reader :order

  def initialize(menu = Menu.new)
    @order = []
    @menu = menu
  end

  def see_menu
    @menu.check_menu
  end

  def add(dish)
    
    raise "Item not on menu" if @menu.menu[dish].nil?
    @order << dish
    "You now have #{@order.count(dish)} of the #{dish} meal in your order"
  end

  def check_total
    total = 0
    @order.each { |dish|
      # puts "#{dish} - £#{@menu.get_price(dish)}" 
      total += @menu.get_price(dish)
    }
    # puts "-" * 15
    # puts "Total - £#{total}"
    total
  end

  def place_order
    Text.new.send_text
  end
end
