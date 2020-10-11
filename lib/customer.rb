require 'twilio-ruby'
class Customer

  def initialize
    @phone = nil
  end

  def input_number
    puts "What number should we text a confirmation to?"
    @phone = "+44#{gets.chomp}"
  end

  def send_confirmation
    send_text if !@phone.nil?
    puts "A text has been sent confirming your order"
  end

  private

  def print_confirmation
    puts "A text has been sent confirming your order"
  end

  def send_text
    account_sid = 'AC5500b960ae18a5f094a8171473453196'
    auth_token = '3913acc29fa291c3dc4cd81ccb43c080'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+4407516726133'
    to = @phone

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}."
    )
  end

  def one_hour_from_now
    "#{(Time.now.hour + 1)}:#{Time.now.min}"
  end
end
