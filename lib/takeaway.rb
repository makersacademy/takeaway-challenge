#takeaway is like the restaurant. It should allow customers see a list of dishes and prices from the menu.

require_relative 'menu.rb'

class Takeaway

    attr_accessor :meals, :menu

    def initialize
      @meals = Menu.new
      @menu = meals.menu_list
    end

  # def menu
  #   #In Meals class I add dishes to menu_list array with a method called add_meal. I want to read this data in this menu method in the Takeaway class but it won't work. I get an empty array no matter what.
  #   menu.menu_list
  # end

end
