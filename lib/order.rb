require_relative 'menu.rb'

class Order
  attr_reader :basket
  def initialize
    @basket = []
  end

  def show_menu
    Menu.new.menu_list.each do |item|
      puts "#{item[:dish]}:  #{item[:price]} pounds"
    end 
    return 
  end  

  def add_to_basket(item)
    @basket << item
  end  
end  