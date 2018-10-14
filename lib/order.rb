
class Order
  attr_reader :meals, :menu

  def initialize(menu)
    @meals = Hash.new(0)
    @menu = menu
  end

  def add(meal, number)
    meals[meal] += number
  end

  def total
    total = 0
    meals.each { |meal,quantity| total += menu.price(meal) * quantity }
    total
  end
end
