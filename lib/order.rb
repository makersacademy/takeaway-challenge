require_relative 'menu'
class Order

  attr_reader :food_ordered, :current_total, :menu, :current_total

  def initialize(*food)
    @menu = Menu.new.menu
    order(food)
  end

  def order(food)
    @food_ordered = food
  end

  def cost(food)
    @current_order = 0
    food.each do |item|
      @current_order = @current_order + Menu.new.menu[item]
    end
    @current_order
  end

end

#For some reason, when cost method is give a variable which represents an array, it doesn't like it. And yet, when give an array directly, it's fine
