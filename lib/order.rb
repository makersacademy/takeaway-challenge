require_relative 'menu'

class Order
  attr_reader :current_order, :current_total
  def initialize
   @current_order=[]
   @current_total=0
  end
  def add_dish(menu, dish, quantity)
    if menu.dish_list.include?(dish)
      add_money(menu, dish, quantity)
      current_order << {dish => quantity}
    "You have ordered #{quantity} #{dish}"
  else
    raise 'Error you must select an item on the menu'
    end

  end

  def add_money(menu, dish, quantity)
    @current_total = @current_total + (menu.dish_list[dish] * quantity)
  end

end
