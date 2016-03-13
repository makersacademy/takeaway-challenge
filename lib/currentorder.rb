require_relative 'order'

class CurrentOrder

  attr_reader :current_order

  def initialize
    @current_order = {}
  end

  def new_item(order)
    current_order.merge!(order)
  end

end
