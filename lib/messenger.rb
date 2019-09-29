require 'twilio-ruby'

class Messenger

  def initialize
    @account_sid = "#{ENV["ACSID"]}"
    @auth_token = "#{ENV["AUTHTOK"]}"
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = "#{ENV["TWIFROM"]}"
    @to = "#{ENV["PHONE"]}"
    @message = "Thanks for your order! Delivery time is #{delivery_time}"
  end
  
  def send_message
    @client.messages.create(
      from: @from,
      to: @to,
      body: @message % delivery_time
    )
  end

  private

  def delivery_time
    time = Time.new.getlocal + (60 * 60)
    time.strftime('%H:%M')
  end
end
