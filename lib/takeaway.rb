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
    @order_now, @dish = order_now, dish
    many.times do
      @order_now.items << @menu.dishes.select{ |obj| obj.name == @dish}
    end
    # @order_now.items.count > 0 ? 
  end

end
