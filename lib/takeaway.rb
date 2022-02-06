require "./lib/order"
require "./lib/menu"

class Takeaway # Takeaway class 

  attr_reader :menu, :order # providing read accessibility to menu 

  def initialize(menu:, order:) # initializing menu
    @menu = menu # setting instance variable 
    @order = order || Order.new(menu) 
  end 

  def print_menu # defining print menu 
    menu.print # saying menu should respond to print
  end

  def user_order(dishes)
    dishes.each do |dish, number|
      order.add(dish, number) 
    end
    order.total  
  end  
end # closing class
