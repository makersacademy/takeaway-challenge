class Price
  attr_reader :true_total

  def initialize
    @true_total = 0
  end

  def food_conversion(array)
    food_prices = {
      "Mozzarella Sticks" => 3.49,
      "Garlic Bread" => 3.99,
      "Chicken Bites" => 2.99,
      "Margherita Pizza" => 12.99,
      "Pepperoni Pizza" => 16.99,
      "Vegetarian Pizza" => 16.99,
    }

    array.map { |food| @true_total += food_prices[food] }
    @true_total = @true_total.round(2)
  end

end
