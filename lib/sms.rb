#enables sending a text message

require 'twilio-ruby'
require 'date'

module SMS

  ACCOUNT_SID = 'AC9dce0a05165a925f9021ddc445ccd961'
  AUTH_TOKEN = '0bbc67f9bad2bf369d2bec4e1c5f525e'

  def self.send_message
  client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  message = "Thank you! Your order was placed and will be delivered before #{SMS.delivery_time}."
  client.account.messages.create(
    :from => '+441289466028',
    :to => '+447825069388',
    :body => message
    )
  self.confirm_message
  end

private
  def self.delivery_time
    @time = (Time.now + 60*60).strftime('%H:%M')
  end

  def self.confirm_message
    "You should receive a text message confirming your order and delivery time."
  end

end
