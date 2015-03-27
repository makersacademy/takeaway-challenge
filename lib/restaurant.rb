class Restaurant
  def dishes
    { chicken: '£1', fish: '£1' }
  end

  def order item, number
    order = Order.new
    order.send item, number
    order
  end
end