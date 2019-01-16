class Takeaway

  INVALID_DISH = "Dish not on menu; order ignored"

  def initialize(menu = Menu.new)
    @menu = menu
    setup_basket
  end

  def menu
    @menu.list
  end

  def order(dish, quantity = 1)
    if @menu.has_dish?(dish)
      add_to_basket(dish, quantity)
    else
      puts INVALID_DISH
    end

  end

  def basket
    @basket.select { |k, v| v > 0 }
  end

  def setup_basket
    @basket = {}
    populate_valid_dishes
  end

  def populate_valid_dishes
    menu.each_key { |dish| @basket[dish] = 0 }
  end

  def add_to_basket(dish, quantity)
    @basket[dish.to_sym] += quantity
  end

end