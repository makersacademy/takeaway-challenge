require_relative 'menu'
require_relative 'message'

class Order
  
  attr_reader :basket, :menu, :message

  def initialize(menu = Menu.new, message = Message.new)
    @basket = {}
    @menu = menu
    @message = message
  end
   
  def add_to_order(item)
    if menu.dishes.has_key?(item.to_sym) then @basket[item.to_sym] = menu.dishes[item.to_sym]   # This is convoluted & messy, but I had a tough time pushing existing keys and values inside a hash.
    "Basket Value: £#{total_cost}"
    elsif
    fail "#{item} is not available - please select a different item."
    end
  end
  
  def place_order(price)
    fail "Please check the sum of your basket and try again." unless price == total_cost
    message.send              # Failed to write working test.
    clear_order
  end

  def clear_order
    @basket.clear
  end
  
  private
    
  def total_cost
    @basket.values.inject(&:+)
  end
end