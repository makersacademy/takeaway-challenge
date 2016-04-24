require_relative 'menu'

class Takeaway


  attr_reader :order
  attr_reader :menu


def initialize
  @order_items = []
  @order_cost = []
  @menu = {"hamburger" => 5, "cheeseburger" => 6, "fries" => 3, "shake" => 2, "veggieburger" => 5}
end

def menu_list
 @menu
end

def place_order item
  fail "Menu doesn't include this item" if !@menu.has_key?(item)
  @order_items <<   item
  @order_cost << @menu[item]
return "You have ordered #{item} at a cost of #{@menu[item]}"
  end

  def finalize_order
    return "Your order comes to a total of £#{order_total}. To place your order type charge_me(#{order_total})"
  end

  def order_total
   @order_cost.inject(0){|sum,x| sum + x }
 end
 def charge_me()
 end




end