class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu)
    # when order is moved out to its own class - makesure menu the object is added as an argument to orders initialize
    @menu = menu
    @current_order = []
  end


  def order(item, quantity)
    @current_order.fill(item, @current_order.size, quantity)
  end


  def print_menu
    @menu.print
  end
end
