class Order

  attr_reader :completed_order

  def initialize(current_order = CurrentOrder)
    @current_order = current_order
    @completed_order = []
  end

  def new_order(item)
    make_order.new_item(item)
  end

  def review_order
    make_order.order
  end

  def completed
    @completed_order << @current
    @current = nil
  end

  private

  def make_order
    @current ||= @current_order.new
  end
end
