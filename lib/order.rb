require_relative 'menu'
require_relative 'restaurant'

class Order

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @order = {}
    @total = []
    @complete = false
  end

  def add_to_order(quantity,item)
    menu_item = @menu_class.menu.select{|key,value|key["#{item}"]}
    @order[quantity] = menu_item
    @total << menu_item.values.map{|i|i*quantity}
  end

  def show_order
    @order.dup
  end

  def complete?
    @order.empty?
  end

  def check_total
    @total.flatten.reduce(:+)
  end
end
