require_relative 'menu_item'
require 'json'

class Menu
  FRIDGE_CONTENTS = "./lib/italian_dishes.json"
  attr_accessor :specials, :available_dishes
  def initialize
    @specials = []
    @available_dishes = plan_meals(FRIDGE_CONTENTS)
    write_menu
  end

  def view_menu
     look_at(something: @specials)
     return
  end

  protected

  def write_menu
    @specials = []
    list_as_thing(list: @available_dishes)
  end

  def look_at(something:)
    i = 0
    something.length.times{
       puts "#{something[i].name}: £#{something[i].price}"
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
