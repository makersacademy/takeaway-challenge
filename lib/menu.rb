class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "tacos" => 5,
      "burrito" => 5,
      "quesadilla" => 7,
      "enchiladas" => 7
      }
  end

  def print_menu
    @dishes.map { |dish, price|
      "#{dish.capitalize}: £#{price}"
    }.join(', ')
  end

end
