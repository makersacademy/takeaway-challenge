class Text
def send_text(message, numbers_to_message)
    require 'rubygems'
    require 'twilio-ruby'
    require 'dotenv/load'

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

    print message.sid
    return true
end

end

#text = Text.new
#text.send_text('Hello', ['+447590606244'])

