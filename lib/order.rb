require './lib/takeaway'

class Order

  attr_accessor :basket#, :total

  def initialize
    @basket = []
    #@total = 0
  end

  def add_to_basket(current_selection)
    self.basket << current_selection
  end

  def place_order
    calculate_total
    Takeaway.new(SMS).accept_order(self.total)
  end

  #private

  def calculate_total
    self.basket.reduce { |sum, item| sum + (item[:price] * item[:qty]) }
    puts "Total = £#{sum}"
  end

end
