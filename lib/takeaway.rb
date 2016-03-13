class Takeaway

attr_reader :order

def initialize (order_class = Order)
  @order = order_class.new
end

end