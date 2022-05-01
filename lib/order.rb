class Order
  attr_reader :basket, :complete_status, :basket_total

  def initialize
    @basket = [] # [{'pizza': 9.50}, {'pasta': 8.20}]
    @complete_status = false
  end

  def add_to_basket(dishes)
    dishes.each { |dish| basket << dish }
    calculate_basket_total
  end

  def display_basket_and_total
    {basket => basket_total}
  end

  def complete_order(completion_time)
    order_complete?
    basket_empty?
    self.complete_status = true
    self.completion_time = completion_time
  end

  private 

  attr_writer :complete_status, :completion_time, :basket_total

  def basket_empty?
    fail "No dishes in basket!" if basket.empty?
  end

  def order_complete?
    fail "Order already completed!" if complete_status == true
  end

  def calculate_basket_total
    prices = []
    basket.each do |item| 
      prices << item.values[0]
    end
    self.basket_total = prices.sum
  end 
end
