class Takeaway

  attr_reader :menu
  attr_reader :order

  def initialize
    @menu = [:chips => 3, :burger => 4, :pastie => 5]
    @order = []
  end

  def add_to_order(item)
    @order.push(item.to_sym)
  end


end