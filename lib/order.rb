class Order
  attr_reader :current_items

  def initialize 
    @final_order = []
    @current_items = { }
  end 

  def add_item(item, quantity)
    @current_items[:item] = quantity
  end 
end 