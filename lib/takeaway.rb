# Manage the orders of the customer

class Takeaway

  attr_reader :menu
  attr_accessor :order


def initialize(menu)
  @menu = menu
end

def show_menu
  menu.print_menu 
end

def submit_order(order,payment)
  raise "This total is not correct" if !is_payment_correct?(order,payment)
  return send_confirmation(message) if granted_permission?
  "Message not sent"
end

def create_order(order = Order)
  order.new
end

private

def is_payment_correct?(order,payment)
  order.total_cost == payment
end

def send_confirmation(communication = SMSSender, message)
  sender = communication.new
  sender.send_message(message)
  "Message sent"
end



def granted_permission?
  true
end

def message
  current_time = Time.new
  one_hour_later = current_time + 3600
  "Thank you for your order! The delivery should arrive in one hour at #{one_hour_later.strftime("%I:%M%p")} "
end

end
