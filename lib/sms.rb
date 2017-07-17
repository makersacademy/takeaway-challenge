class SMS

  require 'twilio-ruby'

  def initialize(mobile)
    @customer = mobile
    @client = Twilio::REST::Client.new "AC3e7cfd15f893126765351cf0605b8c83", "206c6b77fbd69867c13ae28f1d979592"
    @sender = "+441143032170"
  end

  def send_sms
    @client.messages.create(
      from: @sender,
      to: @customer,
      body: "Hi! Your order has been place and will be delivered before #{time}."
    )

    puts "Order placed!  Confirmation sent to 0#{@customer.to_s[2..-1]}"
  end

  private

  def time
    (Time.new + (60 * 60)).strftime("%H:%M")
  end

end
