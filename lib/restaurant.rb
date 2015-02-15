require 'rubygems'
require 'twilio-ruby'

class Restaurant

  def take_order(order, payment_received = 0, customer)
    if payment_received < order.total_price
      raise "You haven't paid the full amount. No takeaway for you."
    elsif payment_received > order.total_price
      raise "Our takeaway isn't that expensive! Make your order again with the exact amount."
    else
      send_text_message(customer.phone_number)
    end
  end

  def send_text_message(customers_phone_number)
    account_sid = 'AC08f8279f3edd79b7319ae767446c118d'
    auth_token = 'ae72651b676ffc8a4a5785f6d62b6664'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+441583612037',
      to: "#{customers_phone_number}",
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.to_s[11..15]}"
    )
  end

  def delivery_time
    delivery_time = Time.now + (60 * 60)
    delivery_time.round(0)
  end

end