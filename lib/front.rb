require_relative 'item.rb'
require_relative 'menu.rb'
require_relative 'order.rb'

def item_list
  [Item.new("name1", 1.00), Item.new("name2", 1.50)]
end

class Front

  def initialize(menu = Menu.new(item_list), order = Order.new)
    @menu = menu
    @order = order
  end

  def main_choice
    puts "type: 'leave' to exit, 'menu' for the menu, 'add' to add to the order,
'show order' to show the order or 'confirm order' to confirm the order"
    choice = gets.chomp
    case choice
    when 'leave'
      exit
    when 'menu'
      @menu.show_dishes
    when 'add'
      add_choice
    when 'show order'
      @order.show
    when 'confirm order'
      @order.confirm
    end
  end

  def add_choice
    puts "enter choice in form of 'item_name, quantity' (if no quantity is specified 1 is chosen)"
  end

end
