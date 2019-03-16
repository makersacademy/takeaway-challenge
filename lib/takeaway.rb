class Takeaway

  attr_accessor :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def print_menu
    @menu.print
  end

  def place_order(item, quantity)
    @order << { item => quantity }
  end

end
