class Menu
  attr_reader :dishes
  def initialize
    @dishes = {"Kotletai" => 4.00,
               "Cepelinai" => 6.50,
               "Balandeliai" => 5.00,
               "Lietiniai su varske" => 4.50,
               "Burokeliu Sriuba" => 3.90}
  end

  def add food, price
    @dishes.store(food, price)
  end

  def remove food
    fail "This food item is not on the menu!" unless @dishes.key? food
    @dishes.delete_if { |h| h[food] }
  end
end
