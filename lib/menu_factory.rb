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
    categories = hash.map do |name, dishes|
      create_category(name, dishes)
    end
    @menu_class.new(categories)
  end

  private

  def create_category(name, dishes)
    category = @category_class.new(name)
    add_dishes_to_category(dishes, category)
    category
  end

  def add_dishes_to_category(dishes, category)
    dishes.each do |dish|
      dish = create_dish(dish['name'], dish['price'])
      category.add_dish(dish)
    end
  end

  def create_dish(name, price)
    @dish_class.new(name, price)
  end
end
