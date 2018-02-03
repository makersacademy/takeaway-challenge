class Menu

  attr_reader :dishes, :selected

  def initialize
    @dishes = {
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     }
    @selected = []
  end

  def select(dish)
    @selected << { dish => nil }
    @selected.last[dish] = @dishes[dish]
  end

  def sum
    @sum = 0
    @selected.each do |dish|
      dish.each_value { |price| @sum += price }
    end
    @sum
  end
end
