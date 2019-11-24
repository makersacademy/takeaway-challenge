require 'twilio-ruby'
require 'date'

class Messenger

  def initialize
    @account_sid = ENV["account_sid"]
    @auth_token = ENV["auth_token"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_text(customer_number, time)
    from = '++12562897144'
    to = customer_number

    @client.messages.create(
      from: from,
      to: to,
      body: "Thank you for your order! It will be delivered within one hour from #{time.strftime('%H:%M')}"
    )
  end
end
