require 'twilio-ruby'
require 'dotenv/load'

class Text

  def initialize(client = Twilio::REST::Client)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    to_number = ENV['TO_PHONE']
    from_number = ENV['FROM_PHONE']
    @client = client.new(account_sid, auth_token)
  end

  def send
    @client.account.messages.create({
        :to => to_number,
        :from => from_number,
        :body => "Your order should arrive by #{plus_one_hour}",
    })
    puts "Confirmation text message has been sent."
  end

  def plus_one_hour
    time = Time.now
    @time = (time + (60*60)).strftime('%H:%M')
  end

end
