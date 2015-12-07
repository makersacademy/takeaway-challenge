class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "Burger" => 3,
              "Chips" => 2,
              "Drink" => 1 }
  end

  def show
    dishes.map { |item, price| "#{item}: £#{price}"}
  end

  def listed?(item)
    dishes.include?(item)
  end

end
