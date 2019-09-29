require 'menu'
# in this, 'order' means 'this is my order' rather than 'to order'
class Order
  attr_reader :basket, :add_items

  def initialize
    @basket = [{}]
  end

# need to clean this up
  def add_items(customer_order)
    @basket << customer_order
    # the @items thing comes from menu class
  end

end
