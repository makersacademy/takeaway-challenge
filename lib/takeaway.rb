require 'menu'
require 'order'

class Takeaway
attr_reader :order

  def initialize(order = Order.new)
    @order = order
    #this is order object
    # @total = 0
  end 


  def check_menu(all_dishes= Menu.new)
    @alldishes = all_dishes
    # p @dishes
    #@dishes is dishes class
    @alldishes.display_list

  end 

  def place_order(dishes)
    @order = dishes
  end 

  def total(order)
    order.total
  end

end 