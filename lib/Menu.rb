class Menu

  attr_reader :food_we_offer

  def initialize(food_we_offer = { burger: 5, chips: 2 })
    @food_we_offer = food_we_offer
    @your_order = []
  end

  def list_of_dishes
    @food_we_offer
  end

  def select_dish(dish, quantity)
    @your_order.push({dish => quantity})
  end



end
