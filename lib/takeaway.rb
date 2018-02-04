class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.print_menu
  end

  def add_dish(dish, quantity = 1)
    @order.add_to_order(dish, quantity)
    puts "#{quantity} x #{dish} added to your order."
  end

  def show_total
    puts "Your total is £#{'%.2f' % @order.total_cost}"
  end

end
