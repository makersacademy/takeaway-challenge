 
class Takeaway
  def initialize
    @order_dishes = [] 
  end
    
  def retrieve_menu(class_of_menu = Menu)
    @menu = class_of_menu.new
    @menu.dishes
  end

  def add_order_item(dish, quantity = 1)
    ordered_dish = { dish: dish, price: @menu.dishes[dish], quantity: quantity }
    @order_dishes.push(ordered_dish)
  end

end
