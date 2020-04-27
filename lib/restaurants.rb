require 'json'

class Restaurants
  attr_reader :restaurants

  def initialize(menu_class = Menu, menu_item_class = MenuItem)
    @restaurants = []
    @menu_class = menu_class
    @menu_item_class = menu_item_class
  end

  def load_restaurants
    path = File.dirname(__FILE__)
    file = File.open(path + '/restaurants.json')
    JSON.load(file)
  end

  def find_restaurants
    menus = load_restaurants
    menus.each do |menu|
      create_menu(menu)
    end
  end

  def create_menu(hash)
    dishes = []
    dish_info = []
    dishes_hash = hash[hash.keys[0]]

    dishes_hash.each do |name, price|
      dish_info << [name.to_s, price]
      dishes << @menu_item_class.new(name.to_s, price)
    end

    @restaurants << @menu_class.new(hash.keys[0].to_s, *dishes)
    dish_info
  end

  def search_for(menu_name)
    found_menu = @restaurants.detect { |menu| menu.name == menu_name }
    raise 'Restaurant not found' if found_menu.nil?
    found_menu
  end
end
