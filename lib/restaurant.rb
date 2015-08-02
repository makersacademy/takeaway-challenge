class Restaurant

  SECONDS_IN_AN_HOUR = 3600

  attr_accessor :menu, :orders
  attr_reader :phone

  def initialize(contact_no)
    @menu = nil
    @contact_no = contact_no
    @orders = []
  end

  def send_confirmation_to(customer)
    print_status
    phone.send_sms(customer.phone_number, confirmation_msg)
  end

  def receive_order(order, customer)
    return raise_error if not order.valid?
    @orders << order
    send_confirmation_to(customer)
  end

  def check_time(offset = 0)
    "#{(Time.new + offset*SECONDS_IN_AN_HOUR).strftime('%H:%M')}"
  end

  def print_status
    puts "Confirming order....Please check your phone"
  end

  def confirmation_msg
    "Thank you for your order. It is now confirmed "\
    "and will be delivered before #{check_time(1)}"
  end

  def raise_error
    raise "Error: price of dishes does not match total"
  end

end