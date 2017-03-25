# Takeaway class responsible for controling the order
class Takeaway

  def initialize(menu:, order:)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.print_menu
  end

  def place_order(current_order)
    current_order
  end

  private
  attr_reader :menu, :order

end
