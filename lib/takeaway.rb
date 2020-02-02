require 'menu'

class Takeaway
  include Menu
  attr_reader :orders, :total_cost

  def initialize
    @total_cost = 0
    @orders = []
  end

  def show_menu
    MENU.each do |k,v|
      puts "#{k}. #{v[:dish]} - £#{v[:cost]}"
    end
  end

  def order_item(num, quantity = 1)
    @total_cost += MENU[num][:cost] * quantity
    @orders << {dish: MENU[num][:dish], cost: MENU[num][:cost], quantity: quantity} 
  end
  
end
