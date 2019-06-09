require 'order'

class Pierogi

  attr_reader :menu
  attr_reader :order

  def initialize
    @menu = { "small pierogi" => 1, "large pierogi" => 3, "supersize pierogi" => 4,
              "meat pierogi" => 4, "chocolate pierogi" => 2, "honey pierogi" => 2 }
  end

  def add_to_menu(dish, price)
    raise "Price must be a number" unless price.is_a?(Integer)
    @menu[dish] = price
    nil
  end

  def show_food
    pretty_printed_menu = []
    @menu.each do |key, value| 
      pretty_printed_menu << "#{key} for #{value}"
    end
    pretty_printed_menu.join("\n")
  end

  def accept_order(order = Order.new)
    @order = order
  end

  def order_pick(selection)
    price = @menu[selection]
    order_item = [selection, price]
    @order.add_to_order(order_item)
  end
end