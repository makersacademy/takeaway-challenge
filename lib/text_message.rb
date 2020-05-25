def send_text(message, numbers_to_message)
    require 'rubygems'
    require 'twilio-ruby'
    require 'dotenv/load'

    # Your Account Sid and Auth Token from twilio.com/console
    # DANGER! This is insecure. See http://twil.io/secure
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN'] 
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    numbers_to_message.each do |number|
        message = @client.messages.create(
            body: message ,
            from: '+15005550006',
            to: number
        )
    end

    puts message.sid
end
