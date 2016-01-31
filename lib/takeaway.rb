require './lib/menu.rb'

class Takeaway

attr_reader :customer_order

 def view_menu
  Menu.new.menu
 end

 def make_order(order_hash, exact_total)
  @customer_order = order_hash
  order_checker
 end


private

def order_checker
  message = "sorry you have ordered something that doesn't exist"
  message2 = " on the menu, please check your order and try again"
  if (@customer_order.keys - view_menu.keys).empty? != true
    raise "#{message}#{message2}"
  end
end

end
