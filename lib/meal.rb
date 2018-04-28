class Meal
  attr_reader :meal, :menu

  def initialize(menu)
    @meal = []
    @menu = menu
  end

  def add_dish(selection, quantity)
    @menu.menu.each do |dish|
      quantity.times {@meal << dish if dish[:name] == selection}
    end
  end

  def sum_of_meal
    @meal.map { |dish| dish[:price] }.inject(:+)
  end

end
