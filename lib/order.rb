require_relative "menu.rb"

class Order
  attr_reader :basket
  def initialize
    @basket = []
    @menu = Menu.new.menu
    
  end

  def take_order(food, amount)
  
    if @menu.has_key?(food.to_sym) 
      @basket << {name: food, price: @menu[food.to_sym], amount: amount}
      puts "#{amount}x #{food} was added to your basket"
    end

  end 
end 
