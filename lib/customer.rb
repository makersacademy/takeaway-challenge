require_relative 'takeaway'

class Customer
  attr_reader :takeaway, :order
 
  def check_menu
    takeaway.show_menu
  end
  
  def select_item item, quantity = 1
    takeaway.order_item item, quantity
  end
  
  def selection
    order
  end
  
end