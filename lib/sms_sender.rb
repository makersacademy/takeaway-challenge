require 'twilio-ruby'
require 'time'

class SmsSender
  attr_reader :account_sid, :auth_token, :client, :from, :to
  def initialize
    @account_sid = 'AC84579b5711fe20c9d367832993b0d830'
    @auth_token = '5afa537d06fc7069ab9f32e172ca1017'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = '+34955160758'
    @to = '+34722420360'
  end

  def text_confirmation
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time}."
    )
  end

  private

  def delivery_time
    del_time = Time.now + 3600
    del_time.strftime('%H:%M')
  end

end
