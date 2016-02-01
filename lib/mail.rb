
require 'twilio-ruby'
require 'dotenv'
  module Mail
Dotenv.load

    def send
      t = Time.now + 3600
      p "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}"

      #account_sid = ENV['TWILIO_ACCOUNT_SID']
      #auth_token = ENV['TWILIO_AUTH_TOKEN']
      #t = Time.now + 3600

      #@client = Twilio::REST::Client.new account_sid, auth_token


      #@client.messages.create(
        #from: ENV['TWILIO_PHONE'],
        #to: ENV['MY_PHONE'],
        #body: "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}"
        #)

    end
  end
