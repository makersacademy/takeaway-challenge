require 'twilio-ruby'

class Sms

  TIME_FORMAT = "%H:%M"
  def initialize
    account_sid = "ACc6ee53d3ed283fca46d068437baa0adf"
    auth_token = "8544e0bf0d887781980f1d76b6dcc099"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def deliver
    message = @client.account.messages.create(:body => "Your order will be delivered by #{delivery_time}. Enjoy!",
        :to => "+447595229777",
        :from => "+441593362033")
    puts message.sid
  end

  private

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end

end
