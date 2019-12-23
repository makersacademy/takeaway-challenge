# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


require_relative 'order'
require_relative 'menu'

class TakeAway 
  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def show_dishes
    @menu.menu
  end

  def order(order)
    @order.order(order)
  end
  
  
end

