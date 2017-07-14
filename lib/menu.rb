require_relative 'dish.rb'

DISHES = {  "Spaghetti bologneise" => 2.99,
            "Scrambled eggs" => 5
         }

class Menu
  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @dishes = []
    load_dishes
  end

  def to_string
    dishes.map.with_index { |dish, index| "#{index + 1}. #{dish.name}, Price = #{dish.price}" }.join("\n")
  end

  def choose(dish)
    dishes[dish-1]
  end

  def length
    @dishes.length
  end

  private

  attr_reader :dishes, :dish_class

  def load_dishes
    # add load from file
    DISHES.each do |name, price|
      @dishes << @dish_class.new(name, price)
    end
  end
end
