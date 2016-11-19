require './lib/takeaway.rb'

class Order

  attr_accessor :basket, :total, :takeaway

  def initialize(klass)
    @takeaway = klass.new
    @basket = []
    @total = 0
  end

  def add_to_basket(current_selection)
    self.basket << current_selection
  end

  def place_order
    @takeaway.accept_order(self.total)
    "Order has been placed"
  end

  private

  def calculate_total
    self.basket.each { |item| self.total += (item[:price] * item[:qty]) }
    "Total = £#{self.total}"
  end

end
