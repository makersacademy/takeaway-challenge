require_relative 'menu'
class Restaurant

attr_reader :order_cart, :menu, :total_dishes

def initialize
  @order_cart = []

end

def list(menu)
menu.items
end

def select(dish)
  @order_cart << dish
end

def total_dishes
  order_cart.length
end

def order
  an_hour = 60*60
  t = Time.new + an_hour
  g = (t.hour).to_s + ":" + t.min.to_s
  "Thank you! Your order was placed and will be delivered before " + g
end

end
