class Order
  attr_reader :basket, :complete_status

  def initialize
    @basket = [] # [{'pizza': 9.50}, {'pasta': 8.20}]
    @complete_status = false
  end

  def add_to_basket(*dishes)
    dishes.each { |dish| basket << dish }
  end

  def display_basket_and_total # return basket and return basket total
  end

  def complete_order(completion_time)
    basket_empty?
    self.complete_status = true
    self.completion_time = completion_time
  end

  private 

  attr_writer :complete_status, :completion_time

  attr_accessor :basket_dishes, :basket_prices, :basket_total

  def basket_empty?
    fail "No dishes in basket!" if basket.empty?
  end
end
