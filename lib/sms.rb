class SMS

  require 'twilio-ruby'

  def initialize(mobile)
    @customer = mobile

    account_sid = "AC3e7cfd15f893126765351cf0605b8c83"
    auth_token = "206c6b77fbd69867c13ae28f1d979592"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441143032170"

    time = Time.new

    client.messages.create(
      from: from,
      to: @customer,
      body: "Hi! Your order has been place and will be delivered before #{time.hour + 1}:#{time.min}."
    )

    puts "Sent message to #{@acustomer}"

  end

end
