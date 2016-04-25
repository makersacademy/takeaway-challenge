class Menu

  attr_reader :dishes

  def initialize(dish = Dish.new)
    @dish = dish
    @dishes = []
  end

  def print_menu
    @dishes << @dish
    @dishes.map do |dish|
      "#{dish.args[:name]}: £#{dish.args[:price]}"
    end.join(", ")
  end

end