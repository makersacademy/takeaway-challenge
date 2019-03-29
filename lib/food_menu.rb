

class FoodMenu
PRICES = [
  {"food" => 1, "price" => 8},
  {"food" => 2, "price" => 10},
  {"food" => 3, "price" => 8},
  {"food" => 4, "price" => 9},
  {"food" => 5, "price" => 2},
  {"food" => 6, "price" => 2},
  {"food" => 7, "price" => 1},
  {"food" => 8, "price" => 2},
  {"food" => 9, "price" => 2},
  {"food" => 10, "price" => 1},
  {"food" => 11, "price" => 3}
]

  def print
    return menu_options
  end

  def menu_options
    "
    Mains\n
    \n
    1. Burger - £8\n
    2. Pizza - £10\n
    3. Burrito - £8\n
    4. Curry - £9\n
    \n
    Sides\n
    \n
    5. Chips - £2\n
    6. Halloumi - £2\n
    7. Salad - £1\n
    \n
    Drinks\n
    \n
    8. Coke - £2\n
    9. Diet Coke -£2\n
    10. Water - £1\n
    11. Beer - £3\n
    "
  end

  def pricing(option)
    PRICES.each do |y|
      if y["food"] == option
        return y["price"]
      end
    end
  end

end
