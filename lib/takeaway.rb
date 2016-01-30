require_relative 'menu.rb'

class TakeAway
  attr_reader :basket
  
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu.dishes
    @current_order = ''
    @total_amount = 0
  end
  
  def read_menu
    @menu
  end
  
  def complete(price)
    raise "Value does not match the total" unless is_correct_amount?(price)
    "Order Complete"
  end
  
  def order(dish, quantity = 1)
    raise "#{dish} is not on the menu" unless on_the_menu?(dish)
    add_dish_to_basket(dish, quantity)
  end
  
  def basket_summary
    format_basket
    @current_order
  end
  
  def total
    basket_summary
    "Total: £" + "%.2f" % @total_amount
  end
  
  private 
  
  def add_dish_to_basket(dish, quantity = 1)
    @basket[dish] += quantity
  end
  
  def format_basket 
    @basket.each do |key, val|
       order_list(key,val)
       add_to_total(key,val)
    end
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
  
  def add_to_total(key, val)
    @total_amount += price(key) * val
  end
  
  def is_correct_amount?(price)
    @total_amount == price
  end
end