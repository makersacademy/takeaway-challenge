require './lib/takeaway'

class Order

  attr_reader :order

  def initialize
    @order = {}
  end

  def add(item)
    if @order[item] == nil
      @order[item] = 1
    else
      count = @order[item]
      @order[item] = count + 1
    end
    self
  end

end
