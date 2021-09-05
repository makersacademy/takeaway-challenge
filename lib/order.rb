class Order

  attr_reader :selected_items, :total_price

  def initialize
    @selected_items = []
    @total_price = 0
    @successful = false
  end 

  def add_selected_item(name)
    @selected_items << (name)
  end 
  
end 
