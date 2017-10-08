class Takeaway

  attr_reader :total_price

  def initialize
    @total_price = 0
  end

  def dishes
    @dishes = {
    chicken_bhuna: 4.25,
    pilau_rice: 2,
    peshwari_naan: 1.75,
    creamy_lentils: 3,
    onion_bhaaji: 2.75
    }
  end

  def list_dishes_and_prices(dishes)
    dishes.map { |k, v| "#{k}, #{v}" }
  end

  def select_meal(*meal_items)
    selected_meal = dishes.select { |k, v| meal_items.include?(k) }
    @total_price = selected_meal.values.inject(:+)
    selected_meal
  end

  def correct_total_price?(*meal_items)
    total_price == dishes.select { |k, v| meal_items.include?(k) }.values.inject(:+)
  end

end
