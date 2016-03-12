require_relative 'menu'

class Order

  attr_reader :menu, :menu_class

  def initialize(menu_class=Menu)
    @menu_class = menu_class
    @menu = menu_class.new
    @current_order = Hash.new
  end

  def add_to_order(dish, quantity)
    push_to_current_order(dish, quantity)
  end
    
  def see_dishes
   @menu.see_dishes 
  end

  def push_to_current_order(dish, quantity)
     @current_order[dish] = quantity
  end

  def order_total
    calculate_order_total
  end

  def calculate_order_total
    sum = 0
    @current_order.each do |item, qty|
      sum += (@menu.see_dishes[item] * qty )
    end
    sum
  end

  def place_order
    puts "order placed"
  end

end
