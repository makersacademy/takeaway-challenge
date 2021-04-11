require_relative 'menu.rb'
require_relative 'calculator'

class Order
  attr_reader :menu, :basket, :total
  def initialize(menu = Menu.new.availability)
    @basket = []
    @total = 0
    @menu = menu
  end

  def show_menu
    @menu.each do |item|
      puts "#{item[:dish]}:  #{item[:price]} pounds"
    end 
    return 
  end  

  def add_to_basket(item, portions = 1)
    fail "Sorry, #{item[:dish]} is out stock" unless item[:available?]
    portions.times { @basket << { dish: item[:dish], portions: portions } }
    @total += item[:price] * portions
  end  
end  