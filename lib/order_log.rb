class OrderLog

attr_reader :previous_orders

def initialize
  @previous_orders = []
end

def record_order(order)
  previous_orders << order
end 

end
