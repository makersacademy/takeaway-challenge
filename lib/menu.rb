class Menu
  attr_reader :dishes

  def initialize(dishes = default_dishes)
    @dishes = dishes
  end

  def default_dishes
    dishes = []
    dishes << Dish.new("Curry", 8)
    dishes << Dish.new("Rice", 3)
  end

  def print
    puts "Menu:"
    @dishes.each { |dish| print_dish(dish) }
  end

  private

  def print_dish(dish)
    puts "#{dish.name} - £#{dish.price}"
  end
end
