require_relative 'dish'
require_relative 'category'
require 'json'

class MenuFactory

  def initialize(dish_class = Dish, category_class = Category)
    @dish_class = dish_class
    @category_class = category_class
  end

  def create_dishes(filename)
    file = File.read(filename)
    dish_hash = JSON.parse(file)
    make_objects(dish_hash)
  end

  def make_objects(hash)
    hash.map do |key, value|
      category = @category_class.new(key)
      value.each do |item|
        name = item['name']
        price = item['price']
        category << @dish_class.new(name, price)
      end
      category
    end
  end

end
