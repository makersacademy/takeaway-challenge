# Understands the order process
require_relative 'menu'

class Order

attr_reader :list_of_order

  def initialize
    @list_of_order = Hash.new
    @menu = Menu.new
  end

  def add_dish(dish, quantity)
    fail 'This dish is not available' unless check_menu?(dish)
    if @list_of_order.key?(dish)
      @list_of_order[dish] += quantity
    else
        @list_of_order[dish] = quantity
    end
    print "You have added #{quantity}x #{dish} to your basket."
  end

  def check_menu?(dish)
    @menu.view_menu.key?(dish)
  end

end
