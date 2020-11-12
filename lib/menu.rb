class Menu
  attr_reader :dishes

  def initialize(dishes = { "pizza" => 4.99, "burger" => 9.99, "steak" => 14.50,
    "ice cream" => 3.99, "chow mein" => 6.99 })
    @dishes = dishes
  end

end
