class Meal
  attr_reader :meals, :menu

  def initialize(menu = Menu.new)
    @meals = []
    @menu = menu
  end

  def add_dish(selection, quantity)
    @menu.menu.each do |dish|
      quantity.times { @meals << dish if dish[:name] == selection }
    end
  end

  def sum_of_basket
    @meals.map { |dish| dish[:price] }.inject(:+)
  end

  def basket
    meals = @meals.map { |dish| dish[:name] }
    meals.uniq.each { |dish| puts "#{meals.count(dish)} lots of #{dish}" }
  end
end
