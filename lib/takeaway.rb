class Takeaway

  attr_reader :dishes

  def initialize
    @dishes = { "coffee" => 3.00, "coke" => 2.40,
      "pizza" => 8.50, "chicken" => 9.90,
      "fish" => 7.80, "burger" => 9.50 }
    @basket = []
  end

  def print_menu
    dishes
  end

  def order(dish, quantity)
    @dish = dish
    @quantity = quantity
    @order = dishes[dish], quantity
    @cost = (dishes[dish] * quantity).round(2)
    @basket << ["#{@dish} x#{@quantity} = £#{@cost}0"]
    return "#{quantity}x #{dish}(s) has been added to your order"
  end

  def basket_summery
    @basket
  end

  def total

  end

end
