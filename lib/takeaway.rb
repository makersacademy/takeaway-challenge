require_relative 'menu.rb'

class TakeAway
  attr_accessor :basket
  
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu.dishes
    @current_order = ''
  end
  
  def read_menu
    @menu
  end
  
  def order(dish, quantity = 1)
    raise "#{dish} is not on the menu" unless on_the_menu?(dish)
    add_dish_to_basket(dish, quantity)
  end
  
  def basket_summary
    @basket.each do |key, val|
       order_list(key,val)
    end
    @current_order
  end
  
  private 
  
  def add_dish_to_basket(dish, quantity = 1)
    @basket[dish] += quantity
  end
  
  def price(dish)
    @menu[dish]
  end
  
  def order_list(key,val)
    @current_order += key + " x" + val.to_s + ":" + " £" + "%.2f" %(price(key) * val)
  end
  
  def on_the_menu?(dish)
    @menu.include? dish
  end
end