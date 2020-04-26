require 'json'

class Restaurants
  attr_reader :restaurants

  def initialize
    @restaurants = []
  end

  def find_restaurants
    path = File.dirname(__FILE__)
    file = File.open(path + '/restaurants.json')
    data = JSON.load(file)
    @restaurants << create_menu(data[0])
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
