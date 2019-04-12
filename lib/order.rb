require_relative 'menu'

class Order
attr_reader :order
attr_reader :order_array

def initialize
  @order_array = []
end

def add_order
  @order = { :dish => @selection, price: @amount }
  @order_array << @order
end

end
