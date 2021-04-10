require_relative 'takeaway'
class Order
  attr_reader :menu, :selection, :cart

  def initialize(menu = Takeaway.new)
    @menu = menu
    @selection = {}
    @cart = []
  end 

  def place_order(item, amount)
    @selection = { item.to_sym => amount }
    add_to_cart
  end 

  private 
  
  def add_to_cart
    @cart << @selection
  end 
end 
