require_relative 'order'

class TakeAway
  attr_reader :menu, :ordrr
  def initialize
    @menu = Menu.new.get_menu
    @order = Order.new(menu)
  end

  def print_menu
    puts "---Menu---"
    @menu.each { |key, value| puts key.to_s.ljust(10) + " €" + value.to_s }
    puts "---Menu---"
    @menu
  end

  def add_item_to_order(item = nil, quantity = 1)
    fail "Sorry #{item} is not available." if is_the_iteam_on_the_menu?(item)
    fail "Please enter a positive quantity" if is_the_quantity_positive?(quantity)
    @order.add_item_to_order(item, quantity)
  end

  def check_order
    return "You have yet to place an order" if has_an_order_been_made?
    @order.check_order
  end

 def checkout(total)
   @order.place_order(total)
 end

private

 def is_the_iteam_on_the_menu?(item)
     !@menu.include?(item.to_sym)
 end

 def is_the_quantity_positive?(quantity)
     quantity < 1
 end

 def has_an_order_been_made?
     @order.order.empty?
 end
end
