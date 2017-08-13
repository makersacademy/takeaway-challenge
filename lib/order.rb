require_relative './menu.rb'

class Order

  attr_reader :menu, :current_order, :item, :final_total

  def initialize(menu = Menu.new)
    @current_order = {}
    @menu = Menu::MENU
    @final_total = 0
  end
  
  def place_order(dish, quantity)
    @current_order[dish] = quantity
  end

  def check_order
    @current_order
  end

  def total
    @current_order.each do |dish, quantity|
      if menu.include?(dish.to_sym)
        subtotal = quantity * menu[dish.to_sym]
        @final_total += subtotal
      end
    end
  end
  

  
  
end

# for each item in the current order,
# take the key value, compare it to menu and if it's there, extract
# the pair value, multiply it by the pair value in @current_order and add them up'

# if menu.include?(item[0].to_sym) do @current_order[1] * 
