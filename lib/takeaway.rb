class Takeaway
  
  attr_reader :dishes, :order, :price

  def initialize(items)
    @dishes = items
    @order = []
    @price = 0
  end

  def show_list
    @dishes
  end

  def add_to_order(plate)
    @order.push(plate) if @dishes.has_key?(plate) && @price += @dishes[plate] 
  end
    
  def total_price
    @price
  end

end
