require_relative "order"
class Takeaway
  
  def initialize(menu:, order: nil, message: nil) # require argument menu for the takeaway object
    @menu = menu
    @order = order || Order.new(menu)
    @message = message || Message.new
  end

  def show_menu
   menu.read 
  end

  def place_order(dishes)
    add_dishes(dishes)
    message.deliver
    order.total
  end
 
  private
  
  attr_reader :menu, :order, :message# created menu object to be able to return read method
  
  def add_dishes(dishes)
    dishes.each do |item, quantity|
      order.add(item, quantity)
    end
  end
end
