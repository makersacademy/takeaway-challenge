#keeps track of the total for the dishes selected
class Order
  attr_reader :total
  
  def initialize
    @total = 0
  end 

  def add_item(menu_entry)
    @total += menu_entry[:price]
  end
end 
