require_relative './takeaway'
class Menu
  attr_reader :dishes
  def initialize
    @dishes = {margherita: 7.00, marinara: 6.00, meatfeast: 10.50, vegetarian: 9.50}
  end

  def display_menu
    puts @dishes
    puts "Order your pizza now!"
  end
end
