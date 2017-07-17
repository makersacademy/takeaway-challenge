require "./lib/menu.rb"
require "./lib/basket.rb"

class Takeaway
  include Menu

  def initialize
    @welcome = "Welcome to Carlo's"
    @menu = Menu::BURGERS
    @basket = Basket.new
  end

  def welcome
    @welcome
  end

  def menu 
    @menu.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end

  def on_the_menu?(item)
    if !@menu.include?(item.to_sym)
      puts "Not on the menu, please select again"
    else
      @basket.add_to_basket(item)
    end
  end

  def select_from_menu
    puts "Select from menu"
    item = gets.chomp
    while item != ""
      on_the_menu?(item)
      item = gets.chomp
    end
    @basket.view_basket
  end
  
  def check_out
    @basket.check_out
  end

end

