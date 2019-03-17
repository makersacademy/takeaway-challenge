class Takeaway
  
  attr_reader :dishes, :order, :price

  def initialize
    @dishes = { "rice" => 1.25, "banana" => 1.00, "fries" => 2.10 }
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
