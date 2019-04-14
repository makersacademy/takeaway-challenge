require_relative 'menu.rb'

class Takeaway
attr_reader :cart

  def initialize
    @cart = []
  end

  def show_menu
    menu_person = Menu.new
    menu_person.list
    p "Anything you'd like to order?"
    @menu = menu_person.food_list
  end

  def select(food)
    #@cart << { :name => food, :quantity => 1}
    @cart << food
    p "#{food} added to your cart!"
  end

# I need to find a way to count the items in the cart/show quantity
# then caculate the overall payment for the cart
  def sum_magician
      @cart.uniq
  end
end
