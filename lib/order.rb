require_relative 'menu'

class Order
  attr_accessor :order_array, :menu
  ORDER_MIN = 1

  #add menu and item doubles so that I can test the cost of the items ordered

  def initialize
    @order_array = []
    @menu = Menu.new
  end

  def add_to_order(item, quantity = ORDER_MIN)
    raise "That is not on the menu!" unless item_exists?(item)
    quantity.times { @order_array << { item => @menu.price(item) } }
  end

  def item_exists?(item)
    @menu.menu.include?(item)
  end

  def view_order
    @order_array.each do |items|
      items.each { |item, price| puts "#{item}: £#{price}" }
    end
  end


end
