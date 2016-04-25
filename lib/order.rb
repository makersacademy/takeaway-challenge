require_relative 'menu'
require_relative 'restaurant'

class Order

  def initialize(menu_class = Menu)
    @menu_class = menu_class.new
    @orders = {}
    @total = []
  end

  def add_to_order(quantity = 1,item)
    menu_item = menu.select{|key,value|key[item]}
    @orders[quantity] = menu_item
    @total << menu_item.values.map{|i|i*quantity}
  end

  def show_order
    @orders.dup
  end

  def menu
    @menu_class.menu
  end

  def empty?
    @orders.empty?
  end

  def check_total
    @total.flatten.reduce(:+)
  end
end
