class Menu

  attr_accessor :menu_import, :menu, :quantity

  def initialize
    @menu_import
    @menu = File.open('./menu.txt').read.split("\n")
    @quanity
  end

  def view_menu
    puts @menu
  end

  def select_dish
    view_menu
    puts "please select a dish number:"
    number = gets.chomp
    select_quantity
    @menu[number.to_i - 1]
  end

  def select_quantity
    puts "enter a quantity"
    @quantity = gets.chomp.to_i
  end

end
