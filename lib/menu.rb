
class Menu

attr_accessor :dishes

  def initialize
    @dishes = {}
  end

  def insert_meal(meal, price)
    @dishes[meal] = price
  end

  def show_menu
    dishes.map{ |food, price|
    "%s: %.2f" % [food.to_s, price]
  }.join(', ')
  end
end
