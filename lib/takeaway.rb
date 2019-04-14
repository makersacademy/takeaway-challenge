require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway

  attr_reader :basket, :menu

  def initialize
   @menu = Menu.new
   @order = Order.new
   @basket = Hash.new(0)
 end

  def menu
    @menu.show
  end

  def place_order(dish, quantity = 1)
    fail "Sorry we don't have that, check our menu" if !@menu.available?(dish)

    @basket[dish] += quantity
  end

  def total

  end

  def price

  end

  private



end
