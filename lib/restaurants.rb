require 'json'

class Restaurants
  attr_reader :restaurants

  def initialize
    @restaurants = []
  end

  def load_restaurants
    path = File.dirname(__FILE__)
    file = File.open(path + '/restaurants.json')
    JSON.load(file)
  end

  def find_restaurants
    menus = load_restaurants
    menus.each do |menu|
      @restaurants << create_menu(menu)
    end
  end

  def create_menu(hash)
    dishes = []
    dishes_hash = hash[hash.keys[0]]
    dishes_hash.each do |name, price|
      dishes << MenuItem.new(name.to_s, price)
    end
    Menu.new(hash.keys[0].to_s, *dishes)
  end
end
