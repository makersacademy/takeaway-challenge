class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add_dish(dish, quantity = 1)
    @basket[dish] += quantity
  end

  def remove_dish(dish, quantity = 1) #Make custom error!
    fail("Not in basket") if not_in_basket?(dish,quantity)
    @basket[dish] -= quantity
  end

  private

  def not_in_basket?(dish,quantity) 
    @basket[dish] < quantity || @basket[dish] == nil
  end


# add_dish
# remove_dish
# review_order
# clear_order

end
