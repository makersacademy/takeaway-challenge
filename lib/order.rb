require_relative 'bill'
require_relative 'messenger'

class Order
  attr_reader :calculated_amount, :bill, :status
  attr_accessor :detailed_order

  def initialize(detailed_order = [])
    @detailed_order = detailed_order
    @bill = Bill.new
    @status = "not confirmed"
    @message = Messenger.new
  end

  def calculate_total
    @calculated_amount = @bill.calculate(@detailed_order)
  end

  def confirmation(customer_name, customer_phone_number)
    @status = "confirmed"
    timestamp = Time.now
    delivery_time = (timestamp + 3600).strftime("%H:%M")
    message_body = "Thank you #{customer_name}! Your order was placed and will be delivered before #{delivery_time}"
    @message.send_message(customer_phone_number, message_body)
  end
end
