require 'menu'
require 'order'

class Takeaway
attr_reader :order


  def initialize(order = Order.new)
    @order = order
    @total = 0
  end 


  def check_menu(all_dishes= Menu.new)
    @alldishes = all_dishes
    # p @dishes
    #@dishes is dishes class
    @alldishes.display_list

  end 

  def place_order(dishes)
    #make dishes to be a hash
    @order = [dishes]
    
    # dishes.each do |dish, quantity|
    #   @order.dishes.add(dish, quantity)


  end 



end 