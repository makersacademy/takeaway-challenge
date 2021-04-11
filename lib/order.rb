require_relative 'menu'

class Order

  def initialize
    @order = []
  end

  def select(item)
    @order << item
  end

end
