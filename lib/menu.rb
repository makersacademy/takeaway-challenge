require_relative './dish.rb'
require_relative './order.rb'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def show_menu
    @dishes.each do |dish|
      puts "#{dish.name} - #{dish.price}"
    end
  end

  def create_order(*dish)
    Order.new(*dish)
  end
end
