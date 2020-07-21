require_relative 'Menu'
#              Here I have required menu so i can use an instance of it
class Order
  attr_reader :basket, :menu, :basket_total
#              Here I have created a new object menu in my instance of order
  def initialize(menu = Menu.new)
    @basket = []
    @basket_total = []
    @menu = menu
  end

  def show_menu
    menu.dishes.map{ |dish, price| puts "#{dish}\n £#{price}" }
  end


#   I need to get menu item price
  def add(dish_for_basket, quantiy_needed)
    empty_hash = { menu.dishes[dish_for_basket] => quantiy_needed }
    empty_hash.each do |dish, quantity|
      quantity.times { basket << dish }
    end
  end
end

def order_summary
  basket.count()
end


# ATOM RUNNER TEST AREA
order = Order.new
menu = Menu.new


order.show_menu
order.add("fish", 2)
order.add("rice", 2)
p order.basket
p menu.dishes["rice"] # < ---- Syntax for accessing menu price
