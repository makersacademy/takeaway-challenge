require_relative 'selector'

class OrderSystem

  attr_reader :current_order


def initialize
  @current_order = OrderSelector.new
  @final_order = []

end

def total_price
  @existing_order.select {|item| item[:price].inject(:+) }
end

def place_order(item)
  @final_order << @
end

end