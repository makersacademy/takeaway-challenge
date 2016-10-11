require_relative 'menu'

class Order
  
  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu
  end
   
  def add_to_order(item)
    if menu.dishes.has_key?(item.to_sym) then @order[item.to_sym] = menu.dishes[item.to_sym]   # This is convoluted & messy, but I had a tough time pushing existing keys and values inside a hash.
    puts "Total order cost: £#{total_cost}"
    elsif
    fail "#{item} is not available - please select a different item."
    end
  end
  
  def place_order(price)
    fail "You have entered an incorrect amount." unless price == total_cost
    puts "Thank you, your order was successful!" 
    clear_order
  end
  
  def clear_order
    @order.clear
  end
  
  private
    
  def total_cost
    @order.values.inject(&:+)
  end
end