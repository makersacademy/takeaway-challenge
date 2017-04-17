require_relative 'menu'

class Order

attr_reader :order

  def initialize

    @order = []
    @prices = []

  end

  def add_menu_item_to_order(item)
    @order << item

  end

  def total
    @order.each do |item|
      @prices << item.price
    end

    total = @prices.inject(:+)



  end



end

# curry = Menu_item.new("Curry", 5)
# burger = Menu_item.new("Burger",6)
# p curry
# p burger
# menu = Menu.new
# p menu
# menu.add_item(curry)
# menu.add_item(burger)
# p menu
# order = Order.new
# p order
# order.add_menu_item_to_order(curry)
# order.add_menu_item_to_order(burger)
# p order
# p order.total
