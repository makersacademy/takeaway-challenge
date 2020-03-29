require_relative 'menu_item'
require 'json'

class Menu
  FRIDGE_CONTENTS = "./lib/italian_dishes.json"
  attr_accessor :specials, :available_dishes # set to accessor for testing - CHANGE BACK to READER

  def initialize
    # this method will import the dishes as MenuItems from a
    # JSON file and store them as an attribute
    # after writing the tests for the MenuItem class I've
    # decided that it would be better to initialize with
    # an empty specials attribute and use a method to parse
    # the JSON file and use it to create a new MenuItem for each dish
    @specials = []
    @available_dishes = plan_meals(FRIDGE_CONTENTS)
    write_menu
  end
  def view_menu
    #this method will present the menu in a readable format.
     #@specials.each {|key, value| puts "#{key}: £#{value}" }
     #convoluted method in this line, not too big a fan.
     look_at(something: @specials)
     return
  end

  def write_menu
    # this method will take a file in JSON format and turn it
    # into MenuItem instances, then store them in the @specials attribute
    list_as_thing(list: @available_dishes)
  end

  def look_at(something:)
    i = 0
    something.length.times{
       puts "#{specials[i].name}: £#{specials[i].price}"
       i += 1
       }
       return
  end
  def list_as_thing(list:, thing: MenuItem)
    list.each do |key, value|
      @specials.push(thing.new(dish: key, cost: value))
    end
  end
  def plan_meals(ingredients)
    dishes = JSON.parse(check_recipes(ingredients))
  end
  def check_recipes(ingredients)
    file = File.read(ingredients)
  end
end
