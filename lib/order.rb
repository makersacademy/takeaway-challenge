require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_reader :customer_order  

  def initialize(menu)
    @menu = menu
    @customer_order = Hash.new(0)
  end

  def adds_item(dish, quantity)
    fail "That dish is not on the menu" unless @menu.has_dish?(dish)
    @customer_order[dish] = quantity
  end



end