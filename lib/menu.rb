class Menu
  attr_reader :dishes

  DISHES = {  "margherita" => 3.99,
              "pepperoni" => 4.50,
              "bbq chicken" => 4.99,
              "hawaiian" => 5.50,
              "meat lovers" => 5.99 }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def open
    dishes.map { |dish, price| "#{dish}: $#{price}" }
  end
end
