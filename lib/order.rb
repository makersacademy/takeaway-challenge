require_relative 'order'
require_relative 'menu'

class Order

attr_reader :basket 


  def initialize(menu) 
    @menu = menu
    @basket = []
  end

  def add(dish, amount = 1)
    fail "#{dish} is off the menu" unless on_menu?(dish)
    @basket.push({ dish: dish, amount: amount })      
  end

  def remove(dish)
    fail "#{dish} is not in your basket" unless basket.include?(dish)
    basket.delete(dish.downcase)
  end








  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end


end
