require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messager
  # put your own credentials here
  def initialize
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
# set up a client to talk to the Twilio REST AP
  def send_sms(msg)
    text_customer(msg)
  end

  private
    def text_customer(x)
      t = Time.now + 3600

      @client.account.messages.create({
      :from => ENV['from'],
      :to => ENV['to'],
      :body => x +" your order will be delivered before " + t.strftime('%H:%M'),
      })
    end

end
