require './lib/object_list.rb'

class Order
  attr_reader :order_items

  def initialize(order_items = ObjectList.new)
    @order_items = order_items
  end
end