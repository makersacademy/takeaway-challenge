class FoodMenu
PRICES = [
      { "food" => 1, "name" => "Burger", "price" => 8 },
      { "food" => 2, "name" => "Pizza", "price" => 10 },
      { "food" => 3, "name" => "Burrito", "price" => 8 },
      { "food" => 4, "name" => "Curry", "price" => 9 },
      { "food" => 5, "name" => "Chips", "price" => 2 },
      { "food" => 6, "name" => "Halloumi", "price" => 2 },
      { "food" => 7, "name" => "Salad", "price" => 1 },
      { "food" => 8, "name" => "Coke", "price" => 2 },
      { "food" => 9, "name" => "Diet Coke", "price" => 2 },
      { "food" => 10, "name" => "Water", "price" => 1 },
      { "food" => 11, "name" => "Beer", "price" => 3 }
    ]

  def print
    return menu_options
  end

  def menu_options
    "
    ----------------------\n
    Mains\n
    ----------------------\n
    1. Burger - £8\n
    2. Pizza - £10\n
    3. Burrito - £8\n
    4. Curry - £9\n
    ----------------------\n
    Sides\n
    ----------------------\n
    5. Chips - £2\n
    6. Halloumi - £2\n
    7. Salad - £1\n
    ----------------------\n
    Drinks\n
    ----------------------\n
    8. Coke - £2\n
    9. Diet Coke -£2\n
    10. Water - £1\n
    11. Beer - £3\n
    ----------------------"
  end

  def pricing(option)
    PRICES.each do |y|
      if y["food"] == option
        return y["price"].to_i
      end
    end
  end

  def get_name(option)
    PRICES.each do |y|
      if y["food"] == option
        return y["name"]
      end
    end
  end

end
