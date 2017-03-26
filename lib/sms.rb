require 'twilio-ruby'

class SMS

  attr_reader :client

  def initialize
    account_sid = 'AC79cd73d1564eb7cb1506971c6b80435f'
    auth_token = '81c1e7cb4414be499767ee52cb314fe6'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    @client.account.messages.create({
        :to => +447564233072,
        :from => +441173254145,
        :body => "Your order has been banged in the oven! Expected arrival time - #{delivery_time}!",
      })
  end

  def delivery_time
    (Time.now+3600).to_s[11..15]
  end

end
