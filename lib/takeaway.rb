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
    @basket.push(dish)
  end

  def basket
    @basket
  end

end