require_relative 'menu'
require_relative 'order'


class Takeaway
attr_reader :menu_object, :order_array

  def initialize
    @menu_object = Menu.new
    @order_object = Order.new
  end

  def add_dish(name, price)
    @menu_object.add(name, price)
  end

  def show_menu
    raise "No dishes available: Please add dishes to the menu" if @menu_object.show_menu_array.empty?
    @menu_object.show_menu_array.each do |x|
      puts "#{x[:name]} : £#{x[:price]}"
    end
  end

  def add_to_order(order)
    @order_object.add(order, show_menu)
  end

  def order_basket
    @order_object.basket
  end

  def total_order
    @order_object.total
  end

  def order_checkout
    @order_object.checkout
  end

end
