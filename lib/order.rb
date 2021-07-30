require 'menu'
class Order 

  attr_accessor :ordered_dishes, :menu

  def initialize(menu:)
    @menu = menu
    @ordered_dishes = {}
  end

    
  

  def add(dish, quantity)
    raise "#{dish} is not on the menu." unless menu_has_dish?(dish)
    ordered_dishes[dish] = quantity
   
  end

  private

  def menu_has_dish?(dish)
    menu.include?(dish)
  end
  



end
