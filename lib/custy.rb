require_relative 'menu'

class Custy
    
    attr_accessor :food_order, :name
    
    def initialize(name)
      @food_order = []
      @name = name
      @menu = Menu.new
   end
   
   def menu
      @menu.food_list
   end
   
   def select_food
      puts "Select a food?"
      @food_choice = gets.chomp.capitalize
      
      puts "How many would you like?"
      @quantity = gets.chomp.to_i
        subtotal_push
   end
   
   def total
      @food_order.map(&:last).inject(:+)
   end
   
   
   private
   
   def subtotal_push
      @var = @menu.food_list.dup.assoc(@food_choice.to_sym)
      subtotal = @var[1] * @quantity
      @food_order << [@quantity, @var[0], subtotal]
   end
   
   
end
   