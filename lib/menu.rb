class Menu

  attr_accessor :menu_import, :menu

  def initialize
    @menu_import
    @menu = File.open('./menu.txt').read.split("\n")
  end

  def view_menu
    puts @menu
  end

  def select_dish
     puts @menu
     puts "please select a dish number:"
     number = gets
     @menu[number.to_i - 1]
  end
end
