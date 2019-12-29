
class Menu

attr_accessor :dishes

  def initialize
    @dishes = {}
    # inserting some default dishes
    @dishes[:salad] = 1.50
    @dishes[:plantian] = 2.56
  end

  def insert_meal(meal, price)
    @dishes[meal] = price
  end

  def show_menu
    dishes.map{ |food, price|
    "%s: %.2f" % [food.to_s, price]
  }.join(', ')
  end

  def has_dish(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    @dishes[dish]
  end
end
