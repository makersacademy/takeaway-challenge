require_relative "menu"

class Takeaway

  attr_reader :order

  def print_menu
    menu = Menu.new.menu
  end

  def place_order(item)
    @order = item
  end

end
