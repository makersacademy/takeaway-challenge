require 'item'
require 'text'

class Order
  attr_reader :items, :complete

  def initialize(items = [], total = 0, complete = false)
    @items = items
    @total = total
    @complete = complete
  end

  def order(item)
    @items << item
    total(item)
  end

  def total(item)
    item.dish.price * item.qty
  end

  def text(text)
    # raise 'invalid operation: text' unless complete
    text.message
  end
end
