require "./lib/order.rb"
require "./lib/menu.rb"


class Host

  attr_reader :current_menu, :new_order

  def initialize(current_menu = Menu.new, new_order = Order.new)
    @credentials = Dotenv.load
    @current_menu = current_menu
    @new_order = new_order
  end

  def show_menu
    puts "Welcome to Yummy Sushi, today's menu is:"
    @current_menu.show_items.clone
  end

  def add_to_order(item)
    @new_order.add_item(item)
  end

  def show_order
    @new_order.check_order
  end

  def place_order
    #TODO: send text, store orders
    @new_order = new_order.new
    print_recipt

  end

  def print_recipt
    @new_order.print_final_order
  end

end
