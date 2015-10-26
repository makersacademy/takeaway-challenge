module Order

def select_dish(name,quantity)
  raise "Sorry, dish is not available" unless dish_available?(name)
  @order[name] = quantity
  @order
end

def submit_order(amount)
  raise "Please key in the right amount" unless right_amount?(amount)
  "Your order has been placed successfully. You will receive a confirmation text message."
end

def right_amount?(amount)
  order_hash = @order.clone
  order_hash.map{|name,q| q * @menu.dishes[name] if @menu.dishes.key? name}.inject {|sum,n| n + sum} == amount
end

def dish_available?(name)
  @menu.dishes.keys.include?(name)
end

end
