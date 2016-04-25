#require_relative 'menu'
require_relative 'order'

class Takeaway


  attr_reader :order_items, :order_cost, :menu


  def initialize
    @order_items = []
    @order_cost = []
    @menu = {"hamburger" => 5, "cheeseburger" => 6, "fries" => 3, "shake" => 2, "veggieburger" => 5}
    @order_sent = Order.new
  end

  def menu_list
    @menu.dup
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

  def charge_me cost
    fail "Not correct total" if cost != @sum
    @order_sent.send
  end

  private

  def order_total
   @sum = @order_cost.inject(:+)
  end



end