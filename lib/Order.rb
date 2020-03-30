require_relative 'Menu'

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


#
#  This method does not work because it adds the argument not the key value
  def add(dish_for_basket)
    empty_array = []
    menu.dishes.map{ |dish, price| empty_array << dish }
    if empty_array.include?(dish_for_basket)
      puts "added to basket!"
      basket << dish_for_basket
    else
      puts "we dont serve that here I'm afraid :("
    end
  end
end

order = Order.new
menu = Menu.new

order.show_menu
order.add("fish")
