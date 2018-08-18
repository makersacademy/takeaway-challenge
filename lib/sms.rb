require 'twilio-ruby'

class Sms

  def initialize
    account_sid = "AC63e265e321d14d7abcc4d080a20be8db"
    auth_token = "6c5a1d7fe6cb8361c094f06bcfb6a7df"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
      message = @client.messages.create(
        body: "Thank you! Your order will be delivered by #{delivery_time}",
        to: "+447425275774",
        from: "+441344231763")
  end

  def delivery_time
    Time.now + 3600
  end

end
