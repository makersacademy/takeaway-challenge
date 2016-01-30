require_relative 'menulist.rb'
class Menu
  #@menulist = Menulist.new

  def initialize (menu_type)
    @menu = Menulist.new.select(menu_type)
  end

  def show
    puts "Menu:"
    @menu.each{|x,y| puts "#{x}. Price: £#{sprintf('%.2f', y)}"}
  end
end
