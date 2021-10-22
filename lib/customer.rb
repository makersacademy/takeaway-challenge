require 'restraunt'
class Customer

  def initialize(restraunt = Restraunt.new)
    @restraunt = restraunt
    @order_total = []
  end

  def retrieve_menu
    @restraunt.menu
  end 

  def order_selection(order_item)
    @order_total << @restraunt.add_to_order(order_item)
  end 

  def order_complete(phonenumber)
    @restraunt.complete_order(phonenumber)
  end 

end
