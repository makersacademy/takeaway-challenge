# require_relative 'meal'

class Menu
  def initialize
    @menu = []
  end

  attr_accessor :menu

  def add_meal(meal)
    @menu << meal
  end

  def see_menu
    @menu.each {|meal| 
    puts "#{meal.name}: #{meal.price}"
    }
  end

end