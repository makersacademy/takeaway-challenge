require_relative 'menu'


class Order


attr_reader :order

def initialize(dishes)
  @order = {}
  @amount = 0
  @menu = Menu.new(dishes).dishes
end

def select_dish(name,quantity)
  raise "Sorry, dish is not available" unless dish_available?(name)
  @order[name] = quantity
  @order
end

def submit_order(amount)
  raise "Please key in the right amount" unless right_amount?(amount)
  "Thank you! Your order was placed and will be delivered in one hour"
end

def order_reset
  @order = {}
end

private

def dish_available?(name)
  @menu.keys.include?(name)
end

def right_amount?(amount)
  order_hash = @order.clone
  order_hash.map{|name,q| q * @menu[name] if @menu.key? name}.inject {|sum,n| n + sum} == amount
end

end
