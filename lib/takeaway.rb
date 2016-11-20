require 'menu'

class Takeaway

attr_reader :menu, :quantity, :item, :total_cost

  def initialize
    @menu = Menu.new
    @quantity = 1
    @item = "Pizza"
    @total_cost = 10
  end

  def print_menu
    menu.menu_list
  end

  def place_order(item, quantity, price)
    order = "You have ordered #{@quantity} portion of #{@item} at a total cost of £#{@total_cost}"
  end

end
