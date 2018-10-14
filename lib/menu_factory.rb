require_relative 'dish'
require_relative 'category'
require_relative 'menu'
require 'json'

class MenuFactory

  def initialize(dish_class = Dish, category_class = Category,
      menu_class = Menu)
    @dish_class = dish_class
    @category_class = category_class
    @menu_class = menu_class
  end

  def create_menu(filename)
    file = File.read(filename)
    dish_hash = JSON.parse(file)
    make_objects(dish_hash)
  end

  def make_objects(hash)
    categories = hash.map do |key, value|
      category = @category_class.new(key)
      value.each do |item|
        name = item['name']
        price = item['price']
        category.add_dish(@dish_class.new(name, price))
      end
      category
    end
    @menu_class.new(categories)
  end

end
