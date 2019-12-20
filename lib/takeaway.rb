class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print #? syntax
  end

  def order(dishes)
  end
end