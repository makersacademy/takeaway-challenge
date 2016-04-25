class Menu
  attr_reader :dishes
  def initialize
    @dishes = {"Kotletai" => 4.0,
               "Cepelinai" => 6.5,
               "Balandeliai" => 5.0,
               "Lietiniai su varske" => 4.5,
               "Burokeliu Sriuba" => 3.9}
  end

  def add food, price
    @dishes.store(food, price)
  end

  def remove food
    fail "This food item is not on the menu!" unless @dishes.key? food
    @dishes.delete_if { |h| h[food] }
  end
end
