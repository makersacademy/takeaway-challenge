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
    given_total = order_array[1]
    checked_total = @order_checker.check_order(@menu, order_array[0])
    verify_order(given_total, checked_total)
  end

  private

  def verify_order(given_total, checked_total)
    if checked_total == given_total
      p "Total cost = £#{given_total}"
    else
      raise "Incorrect order total provided!"
    end
  end

end
