class Takeaway

  attr_reader :total_price, :selected_meal

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
    @selected_meal = items_and_quantities
  end

  def total_order_price(items_and_quantities)
    prices = dishes.select {|k, v| items_and_quantities.include?(k)}.values
    quantities = items_and_quantities.values

    i = 0
     item_prices = []
    while i < prices.length
      item_prices << prices[i] * quantities[i]
      i += 1
    end
    @total_price = item_prices.inject(:+)
    #need to refactor this method
  end

  def correct_total_price?(dish_prices_and_quantities)
    @total_price == dish_prices_and_quantities.map {|k, v| k*v }.inject(:+)
      #this method effectively checks the total price was correctly calculated
      #by redoing it in a different manner
  end

  # def place_order_and_receive_text(list_of_dishes, quantities, exact_total)
  #   list_of_dishes = select_meal(*meal_items)
  #   exact_total = @total_price
  # end

end
