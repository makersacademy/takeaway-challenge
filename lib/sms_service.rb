require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

class Sms


  def send_sms

    client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']


    time = (Time.new + 3600).strftime('%H:%M')

    client.account.messages.create(
    :from => ENV['from'],
    :to => ENV['to_me'],
    :body => "Thank you! Your order was placed and will be delivered before #{time}")
    puts "Sent message to #{ENV['to_me']}"
  end

end
