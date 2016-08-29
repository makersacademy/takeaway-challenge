require_relative 'menu'
class Restaurant

attr_reader :order_cart, :total_dishes, :menu

def initialize
  @order_cart = []
  @menu = Menu.new
end

def list(things)
things.items
end

def select(dish)
  fail "That item isn't on the menu" if menu.price(dish) == nil
  @order_cart << dish
end

def total_dishes
  order_cart.length
end

def bill_total(things)
  (things.price(@order_cart))
end

def order
  fail "You submitted an empty order" if @order_cart == []
  an_hour = 60*60
  t = Time.new + an_hour
  g = (t.hour).to_s + ":" + t.min.to_s
  "Thank you! Your order was placed and will be delivered before " + g
end

end
