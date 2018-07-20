require_relative './menu.rb'

class Order
  attr_reader :food, :order_array
  def initialize
    @order_array = []
  end

  def add(food)
    @food = food
    Menu::MENU.each do |hash|
      if hash[:food] == @food.to_s
        @order_array << { hash[:food] => hash[:price] }
        puts "1x #{@food}(s) has been added to your basket"
        return @order_array
      end
    end
  end

end
