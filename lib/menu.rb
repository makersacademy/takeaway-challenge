require './lib/food_item.rb'

class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def add(food_item)
    @menu << food_item
  end

  def remove(food_item)
    @menu.delete(food_item)
    @menu
  end

  def display_menu
    @menu.each { |food_item|
      puts "#{food_item.name}: £%.2f" % food_item.price.to_s
    }
  end
end
