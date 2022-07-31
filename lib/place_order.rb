
class Place_order
  attr_reader :current_order
  def initialize
    @current_order = Hash.new(0)
    @menu = Menu.new
  end

  def add(dish, quantity)
    @current_order[dish] += quantity
  end


  def total
    @total_value = 0
    @current_order.each {|dish, quantity|
    @total_value += @menu.dish[dish] * quantity}
    "Your total bill is £#{@total_value}"
  end
end
