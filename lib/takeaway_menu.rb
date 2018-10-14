class TakeawayMenu

  attr_reader :meals

  def initialize
    @meals = {}
  end

  def add(dish)
    @meals[dish.name] = dish.price
  end

  def view_menu
    @meals.map { |meal, price| "#{meal} - #{price}" }
  end

end
