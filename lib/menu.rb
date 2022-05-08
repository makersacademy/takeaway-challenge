require_relative './order'

class Menu

  attr_accessor :menu_import, :menu, :quantity, :order, :dishes

  def initialize
    @menu_import
    @menu = File.open('./menu.txt').read.split("\n")
    @quanity
    @dishes = []
  end

  def view_menu
    puts @menu
  end

  def select_dish
    view_menu
    puts "please select a dish number:"
    puts "when finished hit enter twice"
    @number = gets.chomp
    while !@number.empty? do
      select_quantity
      view_menu
      puts "please select another dish"
      @number = gets.chomp
    end
  end

  def select_quantity
    puts "enter a quantity"
    @quantity = gets.chomp.to_i
    dish_with_qty = @menu[@number.to_i - 1] + ", #{@quantity}"
    @dishes << dish_with_qty
  end

end

