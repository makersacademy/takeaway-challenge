# Takeaway class responsible for controling the order
class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def show_menu
    menu.print_menu
  end

  def place_order(order)
    order
  end

  private
  attr_reader :menu

end
