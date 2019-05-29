require 'menu.rb'
require 'checkout.rb'

class Takeaway
  def initialize(checkout = Checkout.new)
    @checkout = checkout
  end

  def show_menu(menu = Menu.new)
    menu.see_menu
  end

  def order(item,cost)
    @checkout.add(food,price)
  end

end
