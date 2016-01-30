require_relative 'menu.rb'

class TakeAway
  attr_accessor :basket
  
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu.dishes
  end
  
  def read_menu
    @menu
  end
  
  def order(dish, quantity = 1)
    raise "#{dish} is not on the menu" unless @menu.include? dish
    add_dish_to_basket(dish, quantity)
  end
  
  def basket_summary
    @basket.each do |key, val|
     return key + " x" + val.to_s + ":" + " £" + "%.2f" %(price(key) * val)
    end
  end
  
  private 
  
  def add_dish_to_basket(dish, quantity = 1)
    @basket[dish] += quantity
  end
  
  def price(dish)
    @menu[dish]
  end
end