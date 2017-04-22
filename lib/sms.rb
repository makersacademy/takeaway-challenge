require 'twilio-ruby'
require 'date'

class Sms

  def initialize
    account_sid = "AC6f140ad85801f0ff6f70294dbe5adeb0"
    auth_token  = "622956b94a663225ae9a15803f5881f8"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def eta_to_string
    current_time = Time.now.strftime("%H:%M")
    hour = current_time.split("")[1]
    if current_time[0..1] == "23"
      current_time.slice!(0..1)
      return current_time.insert(0, "00")
    end
    current_time.delete(hour).insert(1, (hour.to_i + 1).to_s)
  end

  def send_message
    text = "Thank you! Your order was placed and will be delivered before #{eta_to_string}"
    message = @client.account.messages.create(:body => text,
        :to => "+447450634070",
        :from => "+441293311504")
    puts message.sid
  end

end
