require 'twilio-ruby'

class SMS

  def initialize(account_sid = ENV["ACCOUNT_SID"], auth_token = ENV["AUTH_TOKEN"])
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_confirmation
  message_creation(@client)
  end

  private

  def message_creation(client)
    client.messages.create(message_content)
  end

  def message_content
    {from: ENV["SENDER_NUMBER"],
    to: ENV["MY_NUMBER"],
    body: delivery_message}
  end

  def delivery_message
    "Thank you! Your order was placed and will be delivered by #{time_in_hour}"
  end

  def time_in_hour
    time = (Time.new + 3600).strftime("%H:%M:%S")
  end

end
