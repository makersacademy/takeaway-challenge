require_relative 'dish'

class Menu
  attr_reader :dishes
  DISHES = {
    'Green Curry' => 7,
    'Red Curry' => 7,
    'Yellow Curry' => 7,
    'Pad Thai' => 8,
    'Spring Rolls' => 6,
    'Plain Rice' => 2,
    'Garlic Rice' => 2,
    'Prawn Crackers' => 1
  }

  def initialize(dish_class: Dish)
    @dish_class = dish_class
    @dishes = []
    create_dishes
  end

  def show
    @dishes.each_with_index do |dish, i|
      puts "#{i + 1}. #{dish.name}  £#{dish.price}"
    end
  end

  private

  def create_dishes
    DISHES.each { |name, price| @dishes << @dish_class.new(name, price) }
  end
end
