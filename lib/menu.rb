require_relative 'dishes'

class Menu

  attr_accessor :dishes, :menu

  def initialize
    @dishes = Dishes.new #deliberately tightly coupled for now
    @menu = dishes.dish_list
  end

  def add_dish item, price
    dishes.new_dish item, price
  end

  def update_pricing item, price
    dishes.change_price item, price
  end

  def format_menu
    menu.each do |k,v|
      puts "#{k} : £#{v}"
    end
  end
end