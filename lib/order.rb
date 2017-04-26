# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# It understands how to add available items to an order

require_relative "menu"
require_relative "check"

class Order
  attr_reader :order

 def add(dish)
   @dish = dish
   order_guard(@dish)
 end

private

 def initialize
   @order = []
   @menu = Menu.new.menu
 end

 def order_guard(dish)
   fail "Sorry that item is not on the menu and will not be added." if !item_on_menu?(dish)
   @order.push(dish) ; "We added #{dish} to your order."
 end

 def item_on_menu?(dish)
   @menu.key?(dish)
 end

end
