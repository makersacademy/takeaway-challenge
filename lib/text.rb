require 'twilio-ruby'
require 'dotenv'

class Text

  def initialize(client = Twilio::REST::Client)
    Dotenv.load
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = client.new(account_sid, auth_token)
  end

  def send
    @client.messages.create({
        :to => ENV['TO_PHONE'],
        :from => ENV['FROM_PHONE'],
        :body => "Your order should arrive by #{plus_one_hour}",
    })
    puts "Confirmation text message has been sent."
  end

  def plus_one_hour
    time = Time.now
    @time = (time + (60*60)).strftime('%H:%M')
  end

end
