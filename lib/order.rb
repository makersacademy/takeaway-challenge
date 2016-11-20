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
    puts "When ordering you need to give name of the dish and the amount you wish"
  end

  def add_to_order(item)
    if @menu.items[:item.to_s] == item
    @order_items << @menu.items[:item]
    end
  end

  def display_order
    puts "Your order has the following items: "
    @order_items
  end

  def total
    puts "Order total: #{@order_items[:price.to_i]}"
  end

end
