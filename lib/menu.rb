class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Tacos" => 5,
      "Burrito" => 5,
      "Quesadilla" => 7,
      "Enchiladas" => 7
    }
  end

  def print_menu
    @dishes.map { |dish, price|
      "#{dish.capitalize}: £#{price}"
    }.join(', ')
  end

end
