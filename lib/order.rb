require_relative 'menu'

class Order

  attr_reader :menu, :order_items

  def initialize(menu = Menu.new)
    @menu = menu
    @order_items = []
    @order_price = 0
  end

  def read_menu
    @menu.display
    puts "When ordering you need to give the number of the dish and the amount you wish"
  end

  def add_to_order(item_number)
    # @order_items << @menu.
  end

  def total
  end

end
