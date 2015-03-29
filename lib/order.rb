class Order
  attr_accessor :menu, :order_list

  def initialize 
    @menu
    @order_list = []
  end
    
  def add_menu menu
    @menu = menu
  end 

  def present_menu
    menu.present_menu
  end

  def pick_items(*options)
    options.each { |i| order_list << i }
  end

  def total_price 
  end  

end  