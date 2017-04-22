class Order

  def initialize(menu = nil)
    @menu = menu
  end

  def add(dish)
    total(dish)
  end

  def total(dish)
    price_of_dish = @menu[dish]
  end

end
