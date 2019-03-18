require 'order'
require 'takeaway'

class Menu
  # Dish class here is like Menu of dishes
  attr_reader :dishes

  def initialize(dishes = [{ name: 'chinese', price: 8 }, 
  { name: 'fishandchips', price: 7 }, 
  { name: 'chicken', price: 5 }, { name: 'beef', price: 6 }])
    @dishes = dishes
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

  private 

  def to_string

  end 

end
