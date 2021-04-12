require_relative 'menu'

class Order

attr_reader :order

  def initialize
    @order = []
  end

  def select(item)
    @order << item
  end

end
