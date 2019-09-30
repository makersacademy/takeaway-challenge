require_relative 'menu'
# in this, 'order' means 'this is my order' rather than 'to order'
class Order
  attr_accessor :basket, :menu, :total

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
    @total = 0
  end

  def add_items(item, quantity)
    menu.item_on_menu?(item)
    @basket << { item => quantity }
    calculate_total(item, quantity)
  end

  def calculate_total(item, quantity)
    @total += (menu.items[item] * quantity)
  end

  def print_order
    @basket.each do |items|
      items.each do |item, quantity|
        puts "#{quantity} x #{item}"
      end
    end
  end
end
#
# maria cuffaro
#
#
#
#   def menu
#     @Menu
#   end
#
#
# end
