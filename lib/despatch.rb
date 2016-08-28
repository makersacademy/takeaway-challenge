# => Knows everything about despatching orders
require 'twilio-ruby'
class Despatch

  def initialize(twilio_client=Twilio::REST::Client)
    account_sid = 'AC76807998c792abd7e12cb8e95689f27f'
    @client = twilio_client.new(account_sid, ENV["TWILIO_TOKEN"])
  end

  def send_order
    send_text
    puts "The order is now complete. ETA: #{estimate_eta}"
  end

  def estimate_eta
    eta_time = Time.now + (60*60)
    "#{eta_time.hour}:#{eta_time.min}"
  end

  def send_text
    @client.messages.create(
      from: '+441793250442',
      to: ENV["MY_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{estimate_eta}."
      )
  end

end
