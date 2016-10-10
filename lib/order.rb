require_relative 'menu'

class Order
  
  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu
  end

   
  def add_to_order(item)
    if menu.dishes.has_key?(item.to_sym) then @order[item.to_sym] = menu.dishes[item.to_sym]
      elsif
      fail "#{item} is not available - please select a different option."
    end
  end
  
  def total_cost
    total = @order.values.inject(&:+)
    "Your order will cost a total of: £#{total}"
  end
end