class Customer
  attr_reader :name, :telephone, :order

  def initialize name, telephone
  @name = name
  @telephone = telephone
  @order
  end

  def start_order order_class
    @order = order_class.new
  end  

  def look_at_menu
    order.present_menu
  end

  def pick(*options)
    order.pick_items options
  end  

  def place_order
    order.place_order
  end  

  def confirm_order
    order.confirm_order
  end  
  
end

# class Order
#   def look_at_menu
#   end

#   def pick(*options)
#   end  
# end
