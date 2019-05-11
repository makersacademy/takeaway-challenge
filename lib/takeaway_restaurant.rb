class TakeawayRestaurant
  attr_reader :menu

  def initialize(dishes)
    @menu = dishes
  end

  def order(dishes_and_portions, expected_total)
    total = 0

    dishes_and_portions.each do |dish_and_portion|
      dish = dish_and_portion[:dish]
      portion = dish_and_portion[:portion]

      total += dish.price * portion
    end
    raise "Total is not correct" if @total != expected_total
  end
end
