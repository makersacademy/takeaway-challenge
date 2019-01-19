require "twilio-ruby"

class SMS

  def initialize
account_sid = "ACdbea4f7fe81e307ec38fa38334d78d9a" # Your Account SID from www.twilio.com/console
auth_token = "7f094497b914562353e9623175bb302e"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "?",    # Replace with your phone number
    from: "+441202286073")  # Replace with your Twilio number

puts message.sid
end
end
# class SMS
#
#   TIME_FORMAT = "%H:%M"
#
#   def initialize(config, client: nil)
#     @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
#     @config = config
#   end
#
#   def deliver
#     client.messages.create(message_args)
#   end
#
#   private
#
#   attr_reader :client, :config
#
#   def message_args
#     {
#       from: config[:from],
#       to: config[:to],
#       body: config[:body] % delivery_time
#     }
#   end
#
#   def delivery_time
#     (Time.now + 60 * 60).strftime(TIME_FORMAT)
#   end
# end
