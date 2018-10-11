class Restaurant
  attr_reader :menu

  def initialize
    @menu = {
              "fish" => 10,
              "steak" => 20,
              "chips" => 4,
              "pie" => 12,
              "dessert" => 8
            }
  end

  def bill(basket)
    total = 0
    basket.each { |key, value|
      total += (value * @menu[key])
    }
    total
  end

end
