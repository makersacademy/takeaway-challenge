class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    @dishes.map { |name, price|
      "#{name} £#{price.round(2)}"
    }.join(', ')
  end
end
