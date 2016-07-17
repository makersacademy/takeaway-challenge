require 'twilio-ruby'

class Sms

  def initialize
    account_sid = "ACc6ee53d3ed283fca46d068437baa0adf" # Your Account SID from www.twilio.com/console
    auth_token = "8544e0bf0d887781980f1d76b6dcc099"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def deliver
    message = @client.account.messages.create(:body => "Your order has been confirmed",
        :to => "+447595229777",    # Replace with your phone number
        :from => "+441593362033")  # Replace with your Twilio number
    puts message.sid
  end

end

# class Sms
#   def self.send_message(order_id, host, to, message)
#     new.send_message(order_id, host, to, message)
#   end
#
#   def initialize
#     # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
#     # https://www.twilio.com/user/account
#     account_sid = ENV['ACc6ee53d3ed283fca46d068437baa0adf']
#     auth_token  = ENV['8544e0bf0d887781980f1d76b6dcc099']
#     @client = Twilio::REST::Client.new(account_sid, auth_token)
#   end
#
#   def deliver(order_id, host, to, message)
#     @client.account.messages.create(
#       from:  twilio_number,
#       to:    to,
#       body:  message,
#       status_callback: "http://#{host}/orders/#{order_id}/status"
#     )
#   end
#
#   private
#
#   def twilio_number
#     # A Twilio number you control - choose one from:
#     # https://www.twilio.com/user/account/phone-numbers/incoming
#     # Specify in E.164 format, e.g. "+16519998877"
#     ENV['+441593362033']
#   end
# end
