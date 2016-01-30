require_relative 'menulist.rb'
class Menu
include MenuList

attr_reader :menu
  def initialize (menu_type)
    @menu = select(menu_type)
  end

  def show
    puts "Menu:"
    @menu.each{|x,y| puts "#{x}. Price: £#{sprintf('%.2f', y)}"}
  end

end
