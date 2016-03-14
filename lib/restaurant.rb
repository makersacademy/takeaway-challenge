# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
#
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the
# sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and
# will be delivered before 18:52" after I have ordered
# require 'pry'
class Restaurant
  def initialize(menu_klass: menu_class, order_klass: order_class)
    @menu = menu_klass.new
    @order_klass = order_klass
    create_order
  end

  def view_menu
    @menu.dishes
  end

  def order_add(dish_name, quantity = 1)
    create_order unless @order
    @order.add(dish_name, quantity)
  end

  def order_remove(dish_name, quantity = 1)
    @order.remove(dish_name, quantity)
  end

  def view_order
    @order.view
  end

  def order_summary
    @order.summary
  end

  def checkout
    @order.complete # TODO: would have order.deliver in it
    create_order
  end

  private

  def create_order
    @order = @order_klass.new @menu
  end
end
