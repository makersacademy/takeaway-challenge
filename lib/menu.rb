class Menu
  def initialize
    @dishes = {"margherita" => 4.50, "al funghi" => 5.50, "hot & spicy" => 6.00, "calzone" => 7.50, "hawaiian" => 6.50, "chicken supreme" => 9.50, "garlic bread" => 3.00}
  end

  attr_reader :dishes

  def price(food)
    dishes[food]
  end
end