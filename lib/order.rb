require './lib/menu.rb'

class Order

  attr_reader :select, :order_price, :order_names, :final_price

  def initialize(menu_klass=Menu)
    @menu_klass = menu_klass.new
    @order_names = []
    @order_price = []
  end

  def select(item)
    order = @menu_klass.menu_view["#{item}"]
    @order_price << order
    @order_names << item
  end

  def price
    @final_price = 0
    @order_price.each {|i| @final_price += i}
    @final_price
  end
end
