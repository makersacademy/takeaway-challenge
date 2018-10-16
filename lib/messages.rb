module Messages

  def order_instructions
    "To place order reply with the dish number and quantity one line per dish.\n\n"\
    "For example, if you would like to order 2 Pizzas and 3 Salads then:\n\n"\
    "1 2\n"\
    "3 3\n\n"\
    "Reply MENU to see the menu."
  end

  def menu_message(menu)
    "MENU\n\n"\
    "#{menu.print_out}\n\n"\
    "Reply ORDER to make an order."
  end

  def instructions
    "Reply MENU for a list of dishes.\n\n"\
    "Reply ORDER to make an order.\n\n"
  end

  def try_again
    "Command not understood. Please try again."
  end

  def confirming(order)
    "You have ordered:\n\n#{order.print_out}\n\nThe bill is £#{order.bill}\n\n"\
    "Reply YES to confirm and NO to cancel"
  end

  def confirmation
    now = Time.now
    delivery_time = "#{ now.hour + 1 }:#{ now.min }"
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  def cancel_order
    "Order cancelled"
  end



end
