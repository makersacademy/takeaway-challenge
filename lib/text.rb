require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text
  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @hour_later = (Time.now + 60 * 60).strftime('%H:%M')
  end

  def send_text
    @client.messages.create({
      :from => ENV['FROM'],
      :to => ENV['TO'],
      :body => "Thank you! Your order was placed and will be delivered before #{@hour_later}"
      })
  end
end
