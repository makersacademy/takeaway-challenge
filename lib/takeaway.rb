#takeaway is like the restaurant. It should allow customers see a list of dishes and prices from the menu.

require_relative 'menu.rb'

class Takeaway

    attr_accessor :meals, :menu

    def initialize
      @meals = Menu.new
      @menu = meals.menu_list
    end

end
