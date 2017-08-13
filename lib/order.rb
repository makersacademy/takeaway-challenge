require_relative './menu.rb'

class Order

  attr_reader :menu, :current_order, :item, :final_total

  def initialize(_menu = Menu.new)
    @current_order = {}
    @menu = Menu::MENU
    @final_total = 0
  end
  
  def place_order(dish, quantity)
    raise "That item is not on the menu, please choose again" unless menu.include?(dish.to_sym)
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
  
  def submit_order(payment)
    if payment != @final_total
      raise "Incorrect payment, order not complete" 
    end
    current_order
    final_total
    "Order complete"
  end
   
end
