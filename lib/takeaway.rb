# require 'restaurant'
require_relative 'menu'
require_relative 'user'

class Takeaway

attr_reader :menu, :order

  def initialize
    @order = []
  end


  def take_away_menu
    @menu.menu_list
  end

  def place_order

    #if number provided == to counts_items_in_order
    # sends_order_to_restaurant
    # else, fail "I'm sorry, but your number of items did not
    # match your expect number. Please try again"

  end


  def counts_items_in_order
    @order.count
  end



 def sends_order_to_restaurant
   @takeaway_order << @order
 end


end
