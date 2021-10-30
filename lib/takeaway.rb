require 'menu'

class Takeaway
  
  attr_reader :menu

    def initialize(menu = Menu.new)
      @menu = menu
      # @dishes = []
    end 

    def print_menu
      # p @menu.menu_items
      @menu.menu_items
    end

    # def place_order(dish, num)
    #   @menu.each do |key, value|
    #     if dish == key 
    #     puts "Dishes selected: #{key} x #{num}"
    #     end 
    #   end 
    # end 

  end 
