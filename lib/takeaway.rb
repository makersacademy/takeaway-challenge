require "./lib/menu.rb"
require "./lib/order.rb"

class Takeaway
  attr_accessor :order_now

  def initialize(menu = Menu.new)
    @menu = menu  
  end

  def read_menu 
    @menu.dishes.empty? ? "the menu is empty" : @menu.dishes
  end

  def order(dish, many = 1, order_now = Order.new)
    @order_now = order_now
    @order_now.add_to_order(dish, many, @menu)
  end

  def add(dish, many = 1)
    @order_now.add_to_order(dish, many, @menu)
  end

  def total 
    @total = 0
    @order_now.items.each { |dish| @total += dish.price }
    "Total: £" << ('%.2f' % @total)
  end

  def basket_summary
    summary = @order_now.items.sort { |a, b| a.name <=> b.name }
    @order_now.chunk_dishes(summary).join(", ")
  end

  def checkout
    raise "your basket is empty" if (@order_now.nil? || @order_now.items.empty?)

    @order_now.checkout 
  end

end
