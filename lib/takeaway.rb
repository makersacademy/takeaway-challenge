require_relative "order"
class Takeaway
  
  def initialize(menu:, order: nil) # require argument menu for the takeaway object
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
   menu.read 
  end

  def place_order(dishes)
    dishes.each do |item, quantity|
      order.add(item, quantity)
    end

  end
 
  private
  
  attr_reader :menu, :order # created menu object to be able to return read method

end
