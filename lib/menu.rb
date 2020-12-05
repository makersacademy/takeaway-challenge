class Menu

  attr_reader :dishes

  MEALS = {
    "chicken curry" => 12,
    "lasagne" => 14,
    "pepperoni pizza" => 13,
    "burger and chips" => 12,
    "guinness stew" => 11,
    "braised pork belly" => 15
  }

  def initialize(dishes = MEALS)
    @dishes = dishes
  end

  def view_menu
    @dishes.each { |dish, price| puts "#{dish}: #{price}" }
  end

end
