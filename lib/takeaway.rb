class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    # TODO data structure to store basket?
    # Either take the hash keys?
    # Or make the array up on the fly?
    # But doesn't allow for backtracking orders...
    @basket = []

  end

  def menu
    @menu.list
  end

  def order(dish, quantity = 1)
    if @menu.has_dish?
      quantity.times { @basket.push(dish) }
    else
      puts "Dish not on menu; order ignored"
    end

  end

  def basket
    @basket
  end

end