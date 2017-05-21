module Display

  def print_welcome_message(name)
    p "Welcome to #{name}!"
  end

  def print_receipt(order,total_amount)
    order.each { |dish,quantity| p "#{dish} X#{quantity}" }
    p "Total bill: #{total_amount}"
  end

  def print_incoming_text_warning
    p "You'll be sent a text with an estimated arrival time for your food"
  end


end
