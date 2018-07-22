# Menu contains dishes and their corresponding prices
require_relative "dish"
class Menu

  attr_reader :menu

  def initialize
    @menu = [{name: "meat", price: 10}]
  end 
  
  def print_menu
    @menu.each do |dish|
      puts "#{dish[:name]} ------ #{dish[:price]}"
    end
  end

end
