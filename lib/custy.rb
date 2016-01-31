require_relative 'menu'
require 'twilio-ruby'


class Custy
    
    attr_accessor :food_order
    
    def initialize
      @food_order = []
      
   end
   
   def menu(var = Menu.new)
      var.food_list
   end
   
   def select_food(menu = Menu.new)
      
      @menu = menu
      
      puts "Select a food?"
      @food_choice = gets.chomp.capitalize
      
      puts "How many would you like?"
      @quantity = gets.chomp.to_i
        subtotal_push
   end
   
   def subtotal_push
       
      @var = @menu.food_list.dup.assoc(@food_choice.to_sym)
      
      subtotal = @var[1] * @quantity
      
      @food_order << [@quantity, @var[0], subtotal]
    
   end
   
   def total
      @food_order.map(&:last).inject(:+)
   end
   
   
   
end
   