require_relative 'menu'

class Order

  attr_reader :total_order

  def initialize
    @menu = Menu.new
    @total_order = []
  end

  def read_menu
    @menu.show_menu
  end

  def add_item(item, quantity = 1)
    order_item = {}
    order_item[item] = quantity
    @total_order << order_item
    puts "#{quantity}x #{item}(s) added to your basket"
  end

end
