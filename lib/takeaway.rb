class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    # TODO data structure to store basket?
    # Either take the hash keys?
    # Or make the array up on the fly?
    # But doesn't allow for backtracking orders...
    setup_basket
  end

  def menu
    @menu.list
  end

  def order(dish, quantity = 1)
    if @menu.has_dish?(dish)
      add_to_basket(dish, quantity)
    else
      puts "Dish not on menu; order ignored"
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