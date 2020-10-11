require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway   
  attr_reader :menu  
  
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu    
    @order = order  
  end

  def show_menu     
    @menu.show
  end

  def show_order
    @order.view
  end 

end