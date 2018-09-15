class Menu
  attr_reader :name, :price

  def initialize
    @menu = []
    dish = Dish.new(name, price)
  end

  def add(dish)
    @menu << dish.item
  end

  def show
    @menu
  end
end
