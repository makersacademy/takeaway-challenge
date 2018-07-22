# Menu contains dishes and their corresponding prices
require_relative "dish"
class Menu

  attr_reader :menu

  def initialize
    dish = Dish.new
    @menu = []
    @menu << dish
  end 
  
  def print_menu
    @menu.each do |dish|
      puts "#{dish.details[:name]} ------ #{dish.details[:price]}"
    end
  end

end
