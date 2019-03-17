class Takeaway
  
  attr_reader :dishes, :order

  def initialize
    @dishes = { "rice" => 1.25, "banana" => 1.00, "fries" => 2.10 }
    @order = []
  end

  def show_list
    @dishes
  end

  def add_to_order(plate)
    @order.push(plate) if @dishes.has_key?(plate)
  end
    
end
