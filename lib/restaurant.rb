require_relative 'order'

class Restaurant

MENU = {"Pepes ikan" => 3, "Satay" => 3, "Bakso urat" => 4, "Soto" => 4, "Nasi goreng" => 5}

  def initialize
    @order = Order.new
    @order_history =[]
  end

  def print_menu
    puts "Our traditional indonesian menu includes:\n"
    MENU.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end

  def add_item(item, quantity = 1)
    raise 'Sorry, item not available' if !MENU.include?(item.capitalize)
    @order.items << {item.capitalize => MENU[item.capitalize]}
    # works in IRB. problem must be in @order.items
  end

  # def archive_order
  #   @order_history << @order
  # end

end
