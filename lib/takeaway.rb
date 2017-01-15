class Takeaway

attr_reader :dishes, :basket

  def initialize
    @dishes = {"Chips"        => 0.99,
               "Mac'n'Cheese" => 3.50,
               "Pizza"        => 3.50,
               "Cheeseburger" => 4.99,
               "Ice Cream"    => 1.50 }
    @basket = {}
  end

  def order(dish, quantity)
    @dishes.each do |dish, quantity|
    @basket.add(dish, quantity)
  end
  end

end
