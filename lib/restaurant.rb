class Restaurant

  def take_order(order, payment_received = 0)
    if payment_received < order.total_price
      raise "You haven't paid the full amount. No takeaway for you."
    elsif payment_received > order.total_price
      raise "Our takeaway isn't that expensive! Make your order again with the exact amount."
    else
      "Thank you! Your order was placed successfully and will be delivered in less than an hour."
    end
  end

end