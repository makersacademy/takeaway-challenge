require_relative 'menu'

class Order

  #adds items onto the current_order and tallies up the total

  attr_reader :current_order, :menu, :running_total, :current_order_string

  def initialize
    @current_order = []
    @menu = Menu.new
    @running_total = 0
    @current_order_string = ""
  end

  def select_food(food, quantity = 1)
    raise "Sorry, #{food} isn't on the menu!" if !(menu.options.has_key?(food))
    current_order << {food => quantity}
    current_order_string << (food + " x#{quantity.to_s} = #{(menu.options[food]) * quantity} \n")
    add_to_running_total(food, quantity)
  end

  private
  attr_writer :current_order, :running_total

  def add_to_running_total(food, quantity = 1)
    @running_total += (menu.options[food]) * quantity
  end
  
end
