class Menu

  attr_reader :dishes

  ITEMS_LIST = {
    "Spring Roll" => 0.99,
    "Fried Prawn" => 2.99,
    "Egg Fried Rice" => 1.99,
    "Prawn Cracker" => 0.79,
    "Sweet and Sour Fish" => 3.99,
    "Chilli Chicken" => 4.99,
    "Noodle Soup" => 2.99}

  def initialize
    @dishes = ITEMS_LIST
  end

  def read
    @dishes.each { |item, price| "#{item}: £#{price}, " }
  end

end
