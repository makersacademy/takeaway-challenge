require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = Hash.new(0)
  end
  
  def adds_item(dish, quantity)
    fail "That dish is not on the menu" unless @menu.dish?(dish)
    
    @order[dish] = quantity
    successful_add(dish, quantity)
  end
  
  def total_per_item
    @order.map do |dish, quantity|
      @menu.price(dish) * quantity
    end
  end
  
  def total
    total_per_item.inject(:+)
  end
  
  private

  def successful_add(dish, quantity)
    "You have added #{quantity} #{dish} to your order"
  end

end
