require_relative 'menu'

class Order


  def initialize(menu_class=Menu)
    @menu_class = menu_class
    @menu = @menu_class.new
    @current_order = Hash.new
  end

  def add_to_order(dish, quantity)
    raise INVALID_DISH_ERR unless @menu.check_dish(dish)
    push_to_current_order(dish, quantity)
  end
    
  def see_dishes
   @menu.see_dishes 
  end
  

  def place_order(total)
    raise WRONG_TOTAL_ERR unless correct_total?(total)
  end

  def order_total
    calculate_order_total
  end

  WRONG_TOTAL_ERR = "Sorry, correct total is £#{}"  
  INVALID_DISH_ERR = "Sorry, that is not on the menu" 

  private

  
  def push_to_current_order(dish, quantity)
     @current_order[dish] = quantity
  end
   
  def correct_total?(total)
    total  == calculate_order_total
  end


  def calculate_order_total
    @current_order.map do  |dish, qty|
      (@menu.dish_price(dish) * qty )
    end.inject(:+)

  end
  

end
