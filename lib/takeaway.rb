class Takeaway

  def process_order(order, payment_amount)
    raise "Wrong amount paid" if payment_amount != order.total_cost
  else
    "Your order is processed, text confirming this will be sent shortly"
  end

end


