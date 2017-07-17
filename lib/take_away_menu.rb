require_relative 'order'

class TakeAwayMenu
  def initialize
    @menu = { tuna: 4, frog: 1, lamb: 2, pork: 3 }
    @order = Order.new(menu)
  end

  def menu
    @menu
  end

  def print_menu
    puts "---Menu---"
    @menu.each { |key, value| puts key.to_s.ljust(10) + " €" + value.to_s }
    puts "---Menu---"
    @menu
  end

  def add_item_to_order(item = nil, quantity = 1)
    fail "Sorry #{item} is not available." if !@menu.include?(item.to_sym)
    fail "Please enter a positive quantity" if quantity < 1
    @order.add_item_to_order(item, quantity)
  end

  def check_order
    return "You have yet to place an order" if @order.order.empty?
    @order.check_order
  end

 def place_order(total)
   @order.place_order(total)
 end


end
