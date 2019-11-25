class MenuListing
  attr_reader :dish, :servings_left

  SINGLE_SERVING = 1

  def initialize(dish, servings_left = 0)
    @dish = dish
    @servings_left = servings_left
  end

  def register_sale
    @servings_left -= SINGLE_SERVING
  end
end
