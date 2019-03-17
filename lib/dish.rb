require 'order'
require 'takeaway'

class Dish
  attr_reader :dishes

  def initialize(dishes = [{name: 'chinese', price: 8}, {name: 'fishandchips', price: 7}, {name: 'chicken', price: 5}, {name: 'beef', price: 6}])
  
    @dishes = dishes
  end 


  def display_list
     @dishes.each do |x|
      puts "#{x[:name]} #{x[:price]}"
      #how to make this a return statement and not puts
     end 
    
  end 







  private 

  def to_string


  end 




end 