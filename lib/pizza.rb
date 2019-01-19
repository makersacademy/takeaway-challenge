class Pizza

  attr_reader :view_food_and_price

  def initialize
  end

  def view_food_and_price
    {
  large_margherita: 15.99,
  small_margherita: 10.99,
  large_veggie: 17.99,
  small_veggie: 12.99,
  garlic_bread: 6.99,
  fanta: 2.99,
  oasis: 2.99
  }
  end

end
