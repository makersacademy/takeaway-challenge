class Orders
  attr_accessor :items, :order_list

  def initialize
    @items = Items.new
    @order_list = []
  end

  def print_menu
    puts "Feed your soul. Books delivered:"
    items.list
  end

  def place_order(item)
    order_list << item
  end
end
