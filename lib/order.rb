class Order

  def initialize(menu, customer)
    @menu = menu
    @customer = customer
    @basket = Hash.new(0)
  end

  def total
    @basket.sum { |dish, qty| @menu.dishes[dish] * qty }
  end

  def add_dish(dish, qty)
    fail "Item not on the menu." unless @menu.dishes[dish]

    @basket[dish] += qty
  end

  # def remove_dish(dish)
  #   fail "Cannot remove item, not in basket" if !@basket.dishes[dish]
  #   @basket.delete_at(basket.index(dish))
  # end

  def summary 
  end

end
