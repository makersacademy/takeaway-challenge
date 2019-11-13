class Menu
  DISHES = {
    "bruschetta" => 3,
    "spaghetti carbonara" => 8,
  }

  def dish?(dish)
    DISHES.key?(dish)
  end

  def price(dish)
    raise "'#{dish}' is not on the menu" unless dish?(dish)

    DISHES[dish]
  end

  def print
    DISHES.each { |dish, price| puts "* #{dish}: £#{price}" }
  end
end
