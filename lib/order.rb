class Order
  attr_reader :basket, :complete_status

  def initialize
    @basket = []
    @complete_status = false
  end

  def add_to_basket(dishes)
    dishes.each { |dish| basket << dish }
  end

  def complete_order
    self.complete_status = true
  end

  private 

  attr_writer :complete_status
  
end
