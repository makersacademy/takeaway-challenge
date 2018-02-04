require_relative 'order'

class Restaurant

MENU = {"Pepes ikan" => 3, "Satay" => 3, "Bakso urat" => 4, "Soto" => 4, "Nasi goreng" => 5}

  attr_reader :menu, :order_history
  attr_accessor :order

  def initialize(order = Order.new)
    @order_history =[]
    @menu = menu
    @order = order
  end

  def print_menu
    puts "Our traditional indonesian menu includes:\n"
    MENU.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end

  def add_item(item, quantity = 1)
    available?(item)
    dish = {item.capitalize => MENU[item.capitalize]}
    @order.add_item(dish, quantity)
  end

  def complete_order
    raise 'Order is empty, please add an item first' if empty?
    order.complete
  end

  def pay

  end

  # def archive_order
  #   @order_history << @order
  #   @order = Order.new
  # end

private

  def empty?
    order.items.empty?
  end

  def available?(item)
    raise "Sorry, #{item} not available" if !MENU.include?(item.capitalize)
  end

end
