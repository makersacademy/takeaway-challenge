require 'twilio-ruby'
require 'dotenv/load'

account_sid = ENV["ACCOUNT_SID"]
auth_token = ENV["AUTH_TOKEN"]

@client = Twilio::REST::Client.new account_sid, auth_token

# class SMS
    t = Time.now
    @t_string = t.strftime "%H:%M"

    # def send
        message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{@t_string}",
        to: "+447921707985",    # Replace with your phone number
        from: "+447458153864")  # Use this Magic Number for creating SMS
        puts message.sid
#     end
# end





