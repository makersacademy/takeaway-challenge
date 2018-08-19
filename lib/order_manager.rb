require_relative 'menu_printer'
require_relative 'order_checker'

class OrderManager

  def initialize(printer = MenuPrinter, order_checker = OrderChecker)
    @printer = printer
    @order_checker = order_checker
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

  def see_menu
    @printer.to_string(@menu)
  end

  def place_order(order_array)
    checker = @order_checker.new(@menu, order_array)
    checker.check_order
  end

end
