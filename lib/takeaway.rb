require_relative 'menu'

class Takeaway
  def initialize(menu_items = {})
    @menu = Menu.new(menu_items)
  end

  def view_menu
    @menu.print
  end

  def create_order
    @order = {}
    puts 'Item:'
    item = gets.chomp
    puts 'Quantity:'
    quantity = gets.chomp
    @order[item] = quantity
    @order
  end

  def place_order(order)
  end
end
