require_relative 'menu'

class Order

  attr_reader :order, :menu

  def initialize(dishes = Menu.new)
    @order = Array.new
    @menu = dishes.menu
  end
  
  def add_dish(dish)
    @order << dish if available?(dish) 
  end

  private

  def available?(dish)
    @menu.key?(dish)
  end

end
