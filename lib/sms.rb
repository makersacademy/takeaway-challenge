#enables sending a text message

require 'twilio-ruby'
require 'date'

class Sms

  def send_message
  client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  message = "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  client.account.messages.create(
    :from => ENV['TWILIO_PHONE'],
    :to => ENV['TWILIO_DESTINATION_PHONE'],
    :body => message
    )
  confirm_message
  end

private
  def delivery_time
    hour = 60*60
    (Time.now + hour).strftime('%H:%M')
  end

  def confirm_message
    "You should receive a text message confirming your order and delivery time."
  end

end
