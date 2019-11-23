class MenuListing

  def initialize(dish, available)
    @dish = dish
    @available = available
  end

  def servings_left
    @available
  end

  def register_sale
    @available -= 1
  end
end
