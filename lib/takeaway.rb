class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu)
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
