require 'date'
require 'twilio-ruby'

class Messenger

  def initialize(client = Twilio::REST::Client.new(@account_sid, @auth_token))
    @account_sid = ENV["ACCOUNT_SID"]
    @auth_token = ENV["AUTH_TOKEN"]
    @client = client
  end

  def send_text(customer_number, time)
    from = '++12562897144'
    to = customer_number
    time = time.strftime('%H:%M')

    @client.messages.create(
      from: from,
      to: to,
      body: "Thank you for your order! It will be delivered within one hour from #{time}"
    )
  end
end
