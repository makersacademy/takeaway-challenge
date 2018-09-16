require_relative 'menu'

class Order

  attr_reader :final_order

  def initialize(menu)
    @menu = menu
    @final_order = []
  end

  def add_order(dish)
    fail 'Sorry, #{dish} is not availble' unless @menu.has_dish?(dish) 
    if @menu.has_dish?(dish)
      @final_order.push(dish)
    end
  end

end