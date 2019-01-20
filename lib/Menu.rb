class Menu

  attr_reader :food_we_offer, :your_order

  def initialize(food_we_offer = { 'burger' => 5, 'chips' => 2, 'salad' => 3 },
    your_order = [])
    @food_we_offer = food_we_offer
    @your_order = your_order
  end

  def list_of_dishes
    @food_we_offer
  end

  def select_dish(dish, quantity)
    @your_order.push({ dish => quantity })
  end

end
