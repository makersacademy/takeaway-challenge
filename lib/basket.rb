require_relative 'menu'

class Basket

  attr_reader :dishes

  def initialize
    @menu = Menu::MENU
    @dishes = []
  end

  def place_order
    puts "Please select an item from the menu."
    @item = gets.chomp
    puts "How many would you like?"
    @quantity = gets.chomp
    hash = { @item => @quantity }
    @dishes << hash
    puts "#{@quantity} #{@item}(s) added to your basket"
    puts @dishes
  end
end
