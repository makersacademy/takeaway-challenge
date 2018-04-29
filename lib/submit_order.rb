class SubmitOrder
  def submit(order)
    valid_order?(order)
    text_confirmation
  end

  private

  def text_confirmation
    "Order submitted"
  end

  def valid_order?(order)
    raise if order.empty?
  end
end
