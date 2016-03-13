require_relative 'currentorder'

class Order

  attr_reader :completed_order

  def initialize(current_order = CurrentOrder)
    @current_order = current_order
    @completed_order = []
  end

  def new_order(item,value)
    make_order.new_item(item => value)
  end

  def review_order
    make_order.order_review
  end

  def completed
    @completed_order = @current
    @current_order = nil
    @current = nil
  end

  private

  def make_order
    @current ||= @current_order.new
  end
end
