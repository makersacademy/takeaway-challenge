require 'rubygems'
require 'twilio-ruby'

class TwilioResponse

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    time = Time.new
    hour = time.hour + 1
    minute = time.min

    return_text = 'Thank you. Your order has been placed and will be delivered before' #{hour.to_s}:#{minute}''

    @client.account.messages.create(from: '+442033223858',
                                    to: '07459747193',
                                    body: return_text + " " + (time.hour + 1).to_s + ":" + (time.min).to_s)
  end

end