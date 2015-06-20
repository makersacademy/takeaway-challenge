# require 'twilio-ruby'

# class Texter

#   account_sid = ENV['SID']
#   auth_token = ENV['AUTH_TOKEN']
#   @client = Twilio::REST::Client.new account_sid, auth_token

#   time = Time.new
#   dtime = time + 3600
#   delivery_time = dtime.strftime("%I:%M%p")

#   @message = @client.account.messages.create(:body => "Thanks for ordering! Your meal will be delivered to you by #{delivery_time}",
#       :to => "+44 07482606928",
#       :from => "+44 1254313397")

#   def self.call
#     puts @message.sid
#   end

# end