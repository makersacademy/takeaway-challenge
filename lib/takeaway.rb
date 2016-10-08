require 'twilio-ruby'

class Takeaway




















  # def send_message
  #   account_sid = "AC175ffc1e7a9117a7fce465205f64f4e9" # Your Account SID from www.twilio.com/console
  #   auth_token = "f60ac2e885546d154b7d50867b3c8f4d"   # Your Auth Token from www.twilio.com/console
  #
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.account.messages.create(:body => "Thankyou for placing your order. Your food will be with you by #{(Time.new + 60*60).strftime("%R")}.",
  #       :to => "+447540139449",    # Replace with your phone number
  #       :from => "+441202286041")  # Replace with your Twilio number
  #
  #   puts message.sid
  # end
end
