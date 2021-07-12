class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def display_menu
    dishes.map do |dish, price|
      "#{dish}: £#{price}"
    end.join(", ")
  end

end