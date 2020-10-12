class Customer

  def initialize(phone = nil)
    @phone = phone
  end

  def input_number
    puts "What number should we text a confirmation to?"
    @phone = "+44#{gets.chomp}"
  end

  def send_confirmation
    send_text unless @phone.nil?
    puts "A text has been sent confirming your order"
  end

  def send_text(client = Twilio::REST::Client)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    client = client.new(account_sid, auth_token)

    from = ENV["TEST_PHONE"]
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
