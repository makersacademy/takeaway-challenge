class Takeaway

  attr_reader :menu
  
  def initialize 
    @menu = Dishes.new.dishes
    @order = Order.new
  end

  def show_menu
    @menu
  end

  def add_item(dish, quantity = 1)
    @order.add_to_basket(dish, quantity)
    puts " #{quantity}x #{dish} added to your order. "
  end

  def basket
    @order.order_basket
  end

  def total
    puts '%.2f' % @order.total
  end

  def summary
    puts @order.summary
  end

end
