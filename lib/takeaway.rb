class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu)
    # when order is moved out to its own class - makesure menu the object is added as an argument to orders initialize
    @menu = menu
    @order = Order.new(menu)
  end


  def order(item, quantity)
    @order.add_order(item, quantity)
  end

  def current_order
    @order.current_order
  end



  def print_menu
    @menu.print
  end
end
