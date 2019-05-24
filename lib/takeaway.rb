class Takeaway

  def initialize(basket_class = Basket)
    @basket = basket_class.new
  end

  def show_menu
    @basket.show_menu
  end

  def add_to_basket(dish_choice, amount)
    @basket.add_item(dish_choice, amount)
  end

  def checkout(expected_price)
    raise "Price given is not equal to actual price" unless correct_price?(expected_price)
  end

  def get_basket
    @basket.basket
  end

  def get_cost
    @basket.total_cost
  end

  def correct_price?(expected_price)
    get_cost == expected_price
  end

end
