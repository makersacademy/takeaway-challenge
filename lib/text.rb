require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text


  def initialize
    account_sid = ENV['SID']
    auth_token = ENV['AUTH']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create({
      :from => '+441292388059',
      :to => ENV['number'],
      :body => message})
  end

private
  def message
    "Your order will be delivered before #{delivery_time}"
  end

  def delivery_time
    time = (Time.now + (60*60)).strftime("%H:%M")
  end
end
