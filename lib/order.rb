class Order

  def initialize(menu = nil)
    @menu = menu
  end

  def add(dish)
    price_of_dish = @menu[dish]
  end

  def total(dish)

  end

end
