require_relative "menu.rb"

class Order
  attr_reader :basket
  def initialize
    @basket = []
    @menu = Menu.new.menu
    
  end

  def take_order(food)
   
    if @menu.has_key?(food.to_sym) 
       @basket << {food.to_sym => @menu[food.to_sym] }
    end

  end 
end 
