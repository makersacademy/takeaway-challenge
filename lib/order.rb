require  "./lib/menu"
require "date"

class Order 
   
  def initialize(time: time = DateTime, menu: menu = Menu.new )
  @time = time
  @menu = menu
  end

  def request(order)
    "Thank you! Your order will be delivered at 2:00"
  end


end
