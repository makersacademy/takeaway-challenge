require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class SmsHandler
  ONE_HOUR_SECS = 3600

  def send(amount)
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    @client.messages.create(
      from: ENV['FROM_PHONE'],
      to: ENV['TO_PHONE'],
      body: message(amount)
    )
  end

  def message(amount)
    delivery_time = (Time.now + ONE_HOUR_SECS).strftime('%I:%M%p')
    "Thanks for ordering! Total is £#{amount}. "\
    "Expect delivery before #{delivery_time}."
  end
end
