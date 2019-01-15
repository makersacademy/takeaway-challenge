class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    # TODO data structure to store basket?
    # Either take the hash keys?
    # Or make the array up on the fly?
    # But doesn't allow for backtracking orders...

  end

  def menu
    @menu.list
  end

  def order(dish, quantity = 1)

  end

  def basket

  end

end