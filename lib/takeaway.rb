require './lib/menu.rb'
require './lib/sms_sender.rb'
class Takeaway

attr_reader :customer_order

 def view_menu
  Menu.new.menu
 end

 def place_order(order_hash, exact_total)
  @customer_order = order_hash
  order_checker
  message = 'sorry your calculated sum does not match the order total'
  raise(message) if order_sum != exact_total
  sms_send
 end

 def order_sum
  cost = view_menu.map {|k, v| v * @customer_order[k] if @customer_order.key? k}.compact
  cost.inject(:+)
 end


private

def order_checker
  message = "sorry you have ordered something that doesn't exist"
  message2 = " on the menu, please check your order and try again"
  if (@customer_order.keys - view_menu.keys).empty? != true
    raise "#{message}#{message2}"
  end

def sms_send
  Sms.new
end
end





end
