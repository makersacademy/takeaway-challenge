require 'twilio-ruby'

class Communicator
  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def send total
    message = "Thanks for the order! Your total is %<total>.2f. You will receive the order before %<time>s." % {total: total, time: after_hour}
    @client.messages.create(
      body: message,
      to: ENV['TWILIO_DEST_PHONE'],
      from: ENV['TWILIO_REC_PHONE'])
  end
  
  private
  def after_hour
    (Time.now + 3600).strftime("%H:%M")
  end
end
