class Takeaway
  attr_reader :orders

  def initialize
    @orders = []
  end

  def list
    "1 Kappa Maki => £8
     2 Edamame => £5
     3 Vegan Spring Rolls => £6
     4 Vegetarian Potstickers => £6
     5 Sesame Seaweed Salad => £8"
  end

  def order(dish_number)
    dishes = [{"Kappa Maki" => 8},
              {"Edamame" => 5},
              {"Vegan Spring Rolls" => 6},
              {"Vegetarian Potstickers" => 6},
              {"Sesame Seaweed Salad" => 8}]

    orders << dishes[dish_number - 1]
  end

  def total
    calculate_total
  end

  private

  def calculate_total
    sum = orders.map do |orders|
      orders.values
    end
    sum.flatten.sum
  end
end
