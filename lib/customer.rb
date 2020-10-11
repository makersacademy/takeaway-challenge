require 'twilio-ruby'

class Customer

  def initialize(phone = nil)
    @phone = phone
  end

  def input_number
    puts "What number should we text a confirmation to?"
    @phone = "+44#{gets.chomp}"
  end

  def send_confirmation
    send_text if !@phone.nil?
    puts "A text has been sent confirming your order"
  end

  def send_text(client = Twilio::REST::Client)
    account_sid = 'AC5500b960ae18a5f094a8171473453196'
    auth_token = 'e4406214551185379e1bd41d6b7324e2'
    client = client.new(account_sid, auth_token)

    from = '+447782337790'
    to = @phone

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}."
    )
  end

  private

  def one_hour_from_now
    "#{(Time.now.hour + 1)}:#{Time.now.min}"
  end
end
