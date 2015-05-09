require 'twilio-ruby'

class TwilioResponse

  def initialize
    account_sid = 'ACf16002429104e481859dc4625e572723'
    auth_token = 'd8c8dfaf3fedfe2695563568c8344428'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    time = Time.new

    @client.account.messages.create(from: '+442033223858',
                                    to: '07459747193',
                                    body: 'Thank you. Your order has been placed and will be delivered before #{(time.hour + 1).to_s}: #{time.min}')
  end

end