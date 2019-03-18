require 'order'
require 'takeaway'
require 'dish'

class Menu
  # Dish class here is like Menu of dishes
  attr_reader :dishes

  def initialize(dishes = Dish.new)
    @dishes = dishes.dishes
  end 

  def display_list
    @dishes.each do |x|
      puts "#{x[:name]} #{x[:price]}"
     # how to make this a return statement and not puts
    end 
  end 

  def dish?(dish)
    @dishes.any? { |h| h[:name] == dish }
  end 

  def price(dish)
    @dishes.each do |x|
      if x.has_value?(dish)
        return x[:price]
      end 
    end  
  end 
end
