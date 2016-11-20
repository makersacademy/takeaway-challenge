require 'twilio-ruby'

class Messager


def message
  account_sid = "AC16019d9121d703a7d9d74682521dd5d2" # Your Account SID from www.twilio.com/console
  auth_token = "7a57357395822bfd714d22f01b16f780"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        :to => "+447896036978",    # Replace with your phone number
        :from => "+441280830048")  # Replace with your Twilio number
rescue Twilio::REST::RequestError => e
    puts e.message
end

def delivery_time
      time = (Time.new + 1*60*60).asctime
      hour_and_min = time[11,5]
end


end
