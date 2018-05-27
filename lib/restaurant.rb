require_relative './order.rb'
require_relative './confirmation.rb'

class Restaurant 

  attr_reader :menu_items

  def initialize 
    @menu_items ={
      chicken_curry: 9.50, 
      pork_belly: 7.99,
      beef_curry: 7.99,
      orange_chicken: 6.99, 
      spring_rolls: 2.99,
      vegetable_noodles: 3.99,
      mushroom_soup: 1.99
    }
  end


  def view_menu
    index = 1 
    @menu_items.each do |key, value|
      puts "#{index}. #{key}: £#{value}"
      index += 1 
    end
  end

  def create_order 
    Order.new(self)
  end 

end


