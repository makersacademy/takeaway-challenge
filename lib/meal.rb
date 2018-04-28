class Meal
  attr_reader :meal, :menu

  def initialize(menu)
    @meal = []
    @menu = menu
  end

  def add_dish(selection, quantity)
    @menu.dishes.each do |dish|
      quantity.times {@meal << dish if dish[:name] == selection}
    end
  end

end
