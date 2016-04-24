class Restaurant

  def initialize
    @menu = {
       "Curry" => 5,
        "Rice" => 2,
        "Beer" => 3
    }
    @order = Hash.new(0)
  end

  def menu
    @menu.clone
  end

  def order
    @order.clone
  end

  def add_to_order(dish, quantity = 1)
    @order[dish] += quantity
  end

end