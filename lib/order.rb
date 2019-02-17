class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add_dish(dish, quantity = 1)
    @basket[dish] += quantity
  end

  def remove_dish(dish, quantity = 1)
    fail("Not in basket") if not_in_basket?(dish, quantity)
    @basket[dish] -= quantity
  end

  def review_order
    @basket.dup
  end

  def order_total
    @basket.keys.map { |dish| dish.price * @basket[dish] }.reduce(:+)
  end

  private

  def not_in_basket?(dish, quantity)
    @basket[dish] < quantity || @basket[dish] == nil
  end

end
