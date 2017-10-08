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

  def select_meal(items_and_quantities)
    selected_meal = items_and_quantities
    prices = dishes.select {|k, v| items_and_quantities.include?(k)}.values
    quantities = items_and_quantities.values
    i = 0
    total_meal_price = []
    while i < prices.length
    total_meal_price << prices[i] * quantities[i]
    i += 1
    end
    @total_price = total_meal_price
    selected_meal
    #this methid is horrible, need to refactor
  end

  # def correct_total_price?(*meal_items, *quantities)
  #   total_price == dishes.select { |k, v| meal_items.include?(k) }.values.inject(:+)
  # end

  # def place_order_and_receive_text(list_of_dishes, quantities, exact_total)
  #   list_of_dishes = select_meal(*meal_items)
  #   exact_total = @total_price
  # end

end
