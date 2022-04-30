class Order
  attr_reader :basket, :complete_status

  def initialize
    @basket = []
    @complete_status = false
    @completion_time = nil
  end

  def add_to_basket(dishes)
    dishes.each { |dish| basket << dish }
  end

  def complete_order(completion_time)
    self.complete_status = true
    self.completion_time = completion_time
  end

  private 

  attr_writer :complete_status, :completion_time
  
end
