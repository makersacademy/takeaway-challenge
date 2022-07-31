require_relative 'menu'

class Order 
  attr_reader :ordered_food, :menu, :current_selected_food

  def initialize
    @ordered_food = []
    @menu = Menu.new
    @current_selected_food = nil
  end

  def selected_food(food)
    @current_selected_food = food
    @ordered_food << { :selected_food => @current_selected_food }
  end
end
