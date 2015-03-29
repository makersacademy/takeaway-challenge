class Order
  attr_reader :order
  alias_method :list, :order

  def initialize
    @order = []
  end

  def add item
    order << item
  end
end
