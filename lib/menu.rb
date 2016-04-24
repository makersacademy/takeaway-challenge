class Menu
  attr_reader :dishes
  def initialize
    @dishes = {"Koteletai" => 4,
               "Cepelinai" => 6.5,
               "Balandeliai" => 5,
               "Letiniai su varske" => 4.5,
               "Burukeliu Sriuba" => 3.9}
  end

  def add food, price

  end

  def remove food
  end
end
