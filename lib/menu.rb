class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
    pizza, burger= Dish.new('Pizza', 2.50), Dish.new('Burger', 1.50)
    coke, sprite = Dish.new('Coke', 1.00), Dish.new('Sprite', 1.00)
  end

  def show
    output = "Menu:"
    dishes.each{ |dish| output+= "\n#{dish.show_details}" }
    output
  end

  def add_dish(dish)
    dishes << dish
  end
end
