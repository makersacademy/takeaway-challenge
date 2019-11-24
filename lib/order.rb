require_relative "menu"
require_relative "text"

class Order
  
  attr_reader :order

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @order = []
  end

  def see_menu
    @menu = @menu_class.new
    @menu.check_menu
  end

  def add(dish)
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
