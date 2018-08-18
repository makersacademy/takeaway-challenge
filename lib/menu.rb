class Menu

  def initialize(printer = Printer, order_checker = OrderChecker)
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

  def print_menu
    @printer.to_string(@menu)
  end

  def check_order(order_array)
    @order_checker.check_order(@menu, order_array)
  end

end
