require_relative 'dish'
require 'json'

class DishFactory

  def initialize(dish_class = Dish)
    @dish_class = dish_class
  end

  def create_dishes(filename)
    file = File.read(filename)
    dish_array = JSON.parse(file)
    make_objects(dish_array)
  end

  def make_objects(array)
    array.map do |item|
      name = item['name']
      price = item['price']
      type = item['type']
      @dish_class.new(name, price, type)
    end
  end

end
