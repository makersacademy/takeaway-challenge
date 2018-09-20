require 'twilio-ruby'
require 'time'
require 'dotenv'

Dotenv.load 'config.env'

class SmsSender

  ACCOUNT_SID = 'AC84579b5711fe20c9d367832993b0d830'
  AUTH_TOKEN = '5afa537d06fc7069ab9f32e172ca1017'
  attr_reader :account_sid, :auth_token, :client, :from, :to

  def initialize(client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    @account_sid = ACCOUNT_SID
    @auth_token = AUTH_TOKEN
    @client = client
    @from = +34955160758
    @to = +34722420360
  end

  def text_confirmation
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before" +
          " #{delivery_time}.")
  end

  private

  def delivery_time
    del_time = Time.now + 3600
    del_time.strftime('%H:%M')
  end

end
