require_relative 'twilio'

class Checkout

  sms = SMS.new

  def complete_order
    send_text("Thank you for your order: £#{total}0")
  end

  def send_text(message)
    delivery_time = (Time.now + 3600).strftime("%H:%M")
    body = "Thank you for your order! Estimated delivery Time: #{delivery_time}"
    sms.send_sms(body, ENV["MY_NUMBER"])
  end

end
