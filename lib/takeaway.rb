require_relative 'menu' 
require_relative 'order'

class Takeaway
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def menu
    puts @menu
  end

  def order(dish_num, quantity)
    dish, price = @menu.items[dish_num - 1][:dish], @menu.items[dish_num - 1][:price]
    @order.add(dish, price, quantity)
    "#{quantity} x #{dish} - added to your order :)"
  end  

  def basket
    puts @order
  end
end
