class Menu
  # for storing the dishes
  def initialize
    @menu = []
  end

  def add_dish(name, price, dish_klass = Dish)
    @menu << dish_klass.new(name,price)
  end

  def show
    display = {}
    @menu.each do |dish|
      display[dish.name] = dish.price
    end
    display
  end
end
