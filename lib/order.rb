class Order
  attr_reader :meals, :menu

  def initialize(menu)
    @meals = Hash.new(0)
    @menu = menu
  end

  def add(meal, number)
    meals[meal] += number
  end

  def total_cost
    sum = 0
    meals.each { |meal, number| sum += menu.price(meal) * number }
    sum
  end

end
