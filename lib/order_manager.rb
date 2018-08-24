require_relative 'menu_printer'
require_relative 'order_checker'

class OrderManager

  def initialize(printer = MenuPrinter, order_checker = OrderChecker)
    @printer = printer
    create_menu
    @order_checker = order_checker.new(@menu)
  end

  def see_menu
    @printer.to_string(@menu)
  end

  def place_order(order_input)
    order = [build_order(order_input), order_input[1]]
    @order_checker.check_order(order)
  end

  private

  def build_order(order_input)
    order_input[0].map do |order_line|
      menu_index = order_line[0] - 1
      item_quantity = order_line[1]
      [ item: menu_index, quantity: item_quantity ]
    end
    order_input[0].to_h
  end

  def create_menu
    @menu = [
      { dish: "Sea salt & caramel",      price: 3.5 },
      { dish: "Chilli & chocolate",      price: 3.5 },
      { dish: "Avocado cream",           price: 4.0 },
      { dish: "Coconut",                 price: 3.0 },
      { dish: "Praline",                 price: 3.7 },
      { dish: "Watermelon sorbet",       price: 3.5 },
      { dish: "Wild strawberry",         price: 4.5 },
      { dish: "Dark chocolate & cherry", price: 5.5 }
    ]
  end

end
