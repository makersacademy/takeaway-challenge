require 'dishes'

class Takeaway
  attr_reader :menu, :order
  
  def initialize (menu = Dishes.new)
    @menu = menu.dishes 
    @order = []
  end

  def add(dish)
    @order << dish
  end
  
  def bill
    total = 0
    @order.each { |dish| total += @menu[dish] }
    return total
  end

end