require_relative 'menu.rb'

class Order
  def initialize
    @menu = Menu.new 
  end  
  def show_menu
    @menu.menu_list.each do |item|
      puts "#{item[:dish]}:  #{item[:price]} pounds"
    end 
    return 
  end  
end  