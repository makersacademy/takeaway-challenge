require "./lib/messager.rb"
require "./lib/menu.rb"
require "./lib/order.rb"

class Takeaway
  attr_accessor :order_now

  def initialize(menu = Menu.new)
    @messager = Messager.new
    @menu = menu  
  end

  def read_menu 
    @menu.dishes.empty? ? "the menu is empty" : @menu.dishes
  end

  def order(dish, many = 1, order_now = Order.new)
    @order_now, @dish, got_dish = order_now, dish, @menu.get_dish(dish)
    many.times { @order_now.items << got_dish } unless got_dish.nil?
    raise "#{dish} dish is not in the menu" if @order_now.items.empty?
    "#{many}x #{dish}(s) added to your basket"
  end

end
