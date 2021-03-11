require './lib/menu'

class Takeaway

  attr_reader :menu, :active_orders, :order_history
  
  def initialize
    @menu = Menu.new
    @active_orders = Array.new
    @order_history = Array.new
  end

  def new_order

    Order.new
  end

  def order_entry(_order = Order.new)
    puts "Please enter the dish number or name to add to order:"
    input_check($stdin.gets.chomp)
    
  end

  def input_check(input)
    input =~ /\d/ ? input.to_i : input.downcase
  end
end
